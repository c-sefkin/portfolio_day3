class SkillsController < ApplicationController
  before_filter :admin_only, :except => [:index, :show, :show_refs, :hide_refs]

  def index
    @skills = Skill.all
  end

  def show_refs
    respond_to do |format|
      format.js
    end
  end

  def hide_refs
    respond_to do |format|
      format.js
    end
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:notice] = "Skill successfully added!"
      redirect_to skills_path
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    render :edit
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:notice] = "Skill successfully editted!"
      redirect_to skills_path
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    flash[:notice] = "Skill successfully deleted!"
    redirect_to skills_path
  end

private

  def skill_params
    params.require(:skill).permit(:name, :description, :experience)
  end

  def admin_only
    if current_user
      unless current_user.admin?
        go_back
         flash[:alert] = "Access denied."
      end
    else
      go_back
      flash[:alert] = "Access denied."
    end
  end
end
