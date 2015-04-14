class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :issue_number
      t.integer :comic_vine_issue_id
      t.text :description
      t.string :cover_image_url
      t.string :thumbnail_url
      t.string :story_name
      t.integer :volume_id
      t.date :cover_date
      t.timestamps
    end
  end
end
