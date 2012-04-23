class Asset < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  
  after_create do |asset|
    make_url_for(asset)
  end
  
  belongs_to :post
  belongs_to :project
  
  image_accessor :image
  
  def to_jq_upload
      {
        "name" => read_attribute(:image_name),
        "size" => image.size,
        "url" => image.remote_url,
        "thumbnail_url" => image.thumb('80x80').url,
        # "delete_url" => asset_path(:id => id),
        #         "delete_type" => "DELETE" 
      }
  end
  
  def make_url_for(asset)
    asset.url = asset.image.remote_url
    !save
  end
end
