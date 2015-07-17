class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :admin_only, only: [:destroy]
  before_filter :authorized_user, only: [:edit, :update]

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @all_comments = @post.comments.order("created_at DESC")
  end


  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end


  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user.email
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_comment_path(@post, @comment), notice: 'Comment was successfully created.' }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comment_path(@post, @comment), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_comments_path(@post), notice: 'Comment was successfully destroyed.' }
    end
  end

  private

    def set_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:post_id, :author, :body)
    end

    def admin_only
      unless current_user.admin?
        redirect_to :back, :alert => "Access Denied."
      end
    end

    def authorized_user
      unless current_user.email == @comment.author || current_user.admin?
        go_back
        flash[:alert] = "Access Denied."
      end
    end
end
