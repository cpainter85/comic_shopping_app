class AddPublisherIdToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :publisher_id, :integer
  end
end
