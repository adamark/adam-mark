class SessionsController < ApplicationController
  # skip_before_filter :login_user!, only: [:new, :create]
  
  def new
     
  end
  
  def create
    user = User.find_by_email(params[:email])
         if user.present?
           if user.authenticate(params[:password])
             session[:user] = user.id
             redirect_to root_url
           else
             flash.now[:error] = 'Invalid email/password combo..'
             render 'new'
           end
         else
           flash.now[:error] = 'Invalid email/password combo..'
           render 'new'
           # redirect_to login_url, notice: "Incorrect login. Please try again"
         end
  end
  
  def destroy
    reset_session
    redirect_to :root
  end
  
end