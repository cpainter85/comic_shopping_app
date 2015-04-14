class AddLogoUrlToPublishers < ActiveRecord::Migration
  def change
    add_column :publishers, :logo_url, :string
    add_column :publishers, :logo_thumb_url, :string
  end
end
