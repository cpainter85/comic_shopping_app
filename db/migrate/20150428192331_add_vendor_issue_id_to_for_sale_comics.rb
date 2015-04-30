class AddVendorIssueIdToForSaleComics < ActiveRecord::Migration
  def change
    add_column :for_sale_comics, :vendor_issue_id, :integer
  end
end
