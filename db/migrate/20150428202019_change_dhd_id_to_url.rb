class ChangeDhdIdToUrl < ActiveRecord::Migration
  def change
    rename_column :dark_horse_digital_comics, :dhd_id, :url
  end
end
