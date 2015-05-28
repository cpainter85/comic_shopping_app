class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :real_name
      t.string :aliases
      t.integer :comic_vine_character_id
      t.string :short_description
      t.string :full_description
      t.string :image_url
      t.string :thumb_url
      t.timestamps
    end
  end
end
