class CreateIssueCredits < ActiveRecord::Migration
  def change
    create_table :issue_credits do |t|
      t.integer :creator_id
      t.integer :issue_id
      t.string :role
      t.timestamps
    end
  end
end
