class UsersController < ApplicationController
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Updated Successfully!"
      redirect_to root_url
    else
      render 'edit'
    end
  end
  
end