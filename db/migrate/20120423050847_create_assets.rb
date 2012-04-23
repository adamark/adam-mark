class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :image_uid
      t.string :image_name
      t.integer :project_id
      t.integer :post_id
      t.string :url
      t.string :caption
      t.boolean :main

      t.timestamps
    end
  end
end
