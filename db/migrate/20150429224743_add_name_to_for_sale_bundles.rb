class AddNameToForSaleBundles < ActiveRecord::Migration
  def change
    add_column :for_sale_bundles, :name, :string
  end
end
