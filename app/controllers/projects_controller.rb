class ProjectsController < ApplicationController
  # skip_before_filter :login_user!, only: [:show]
  
  def index
    @projects = Project.find(:all, :order => "created_at DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:success] = "Created Successfully!"
      redirect_to projects_url
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:success] = "Updated Successfully!"
      redirect_to projects_url
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find_by_id(params[:id])
    if @project.destroy
      flash[:success] = "Deleted"
      redirect_to projects_url
    else
      render 'edit'
    end
  end
end
