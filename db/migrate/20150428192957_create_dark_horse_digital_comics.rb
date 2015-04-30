class CreateDarkHorseDigitalComics < ActiveRecord::Migration
  def change
    create_table :dark_horse_digital_comics do |t|
      t.string :title
      t.integer :price_in_cents
      t.integer :dhd_id
      t.timestamps
    end
  end
end
