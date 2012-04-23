class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  acts_as_taggable
  acts_as_taggable_on :tags
  
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
end
