class Slugposts < ActiveRecord::Migration
  def change
    add_index :posts, :slug, unique: true
  end
end
