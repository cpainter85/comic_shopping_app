class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :name
      t.integer :comic_vine_creator_id
      t.text :short_description
      t.text :full_description
      t.string :profile_picture_url
      t.string :profile_picture_thumb_url
      t.timestamps
    end
  end
end
