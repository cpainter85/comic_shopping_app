class CreateForSaleBundles < ActiveRecord::Migration
  def change
    create_table :for_sale_bundles do |t|
      t.integer :volume_id
      t.integer :vendor_id
      t.string :url
      t.integer :price_in_cents
      t.timestamps
    end
  end
end
