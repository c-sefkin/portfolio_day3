class ProjectsController < ApplicationController
before_filter :admin_only, :except => [:index, :show]
  def index
    @projects = Project.all
  end

  def show
    @skill = Skill.find(params[:skill_id]=(  Project.find(params[:id]).skill_id)  )
    @project = @skill.projects.find(params[:id])
  end

  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added!"
      redirect_to skill_path(@project.skill)
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:skill_id]=(Project.find(params[:id]).skill_id))
    @project = @skill.projects.find(params[:id])
    render :edit
  end

  def update
    @skill = Skill.find(params[:skill_id]=(Project.find(params[:id]).skill_id))
    @project = @skill.projects.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully editted!"
      redirect_to skill_path(@skill)
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id]=(Project.find(params[:id]).skill_id))
    @project = @skill.projects.find(params[:id])
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to skill_path(@skill)
  end

private

  def project_params
    params.require(:project).permit(:name, :description, :github_link)
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
