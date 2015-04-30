class CreateForSaleComics < ActiveRecord::Migration
  def change
    create_table :for_sale_comics do |t|
      t.integer :issue_id
      t.integer :vendor_id
      t.string :url
      t.integer :price_in_cents
      t.timestamps
    end
  end
end
