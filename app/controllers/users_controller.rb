class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_only
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      go_back
      flash[:alert] = "Access denied."
    end
  end

end
