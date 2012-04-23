module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by_id(session[:user])
  end
  
  def current_user?
    current_user.present?
  end
  
  def current_name
    current_user.name.split(' ')[0]
  end
  
  def login_user!
    if current_user.nil?
      redirect_to login_url, notice: "You gotta sign in!"
    end
  end
  
  def admin?
    current_user.admin == true
  end
  
end