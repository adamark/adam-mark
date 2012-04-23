class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :name, :email, :bio, :handle, :password, :password_confirmation
end