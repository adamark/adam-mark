class PostsController < ApplicationController
  # skip_before_filter :login_user!, only: [:show]
  
  def index
    @posts = Post.find(:all, :order => "created_at DESC")
    @projects = Project.find(:all, :order => "created_at DESC")
    @users = User.first
    @assets = Asset.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Created Successfully!"
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Updated Successfully!"
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.destroy
      flash[:success] = "Deleted"
      redirect_to posts_url
    else
      render 'edit'
    end
  end
end
