class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.integer :comic_vine_pub_id
      t.string :website
      t.string :short_description
      t.text :full_description
      t.timestamps
    end
  end
end
