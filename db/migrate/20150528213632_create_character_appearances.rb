class CreateCharacterAppearances < ActiveRecord::Migration
  def change
    create_table :character_appearances do |t|
      t.integer :issue_id
      t.integer :character_id
      t.timestamps
    end
  end
end
