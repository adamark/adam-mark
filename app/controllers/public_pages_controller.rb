class PublicPagesController < ApplicationController

  def blog
    @blogs = Post.find(:all, :conditions => ["publish = ?", true], :order => "created_at DESC")
  end
  
  def projects
    @web = Project.find(:all, :conditions => ["publish = ? and kind = ?", true, "Web"])
    @photo = Project.find(:all, :conditions => ["publish = ? and kind = ?", true, "Photo"])
    @video = Project.find(:all, :conditions => ["publish = ? and kind = ?", true, "Video"])
    @art = Project.find(:all, :conditions => ["publish = ? and kind = ?", true, "Art"])
  end
  
  def about
    @my = User.find(1)
  end
  
  def contact
    
  end
  
end
