class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.string :name
      t.integer :comic_vine_vol_id
      t.text :description
      t.string :image_url
      t.string :thumbnail_url
      t.integer :start_year
      t.integer :publisher_id
      t.timestamps
    end
  end
end
