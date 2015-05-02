class RenameDarkHorseDigitalComicsToVendorData < ActiveRecord::Migration
  def change
    rename_table :dark_horse_digital_comics, :vendor_data
  end
end
