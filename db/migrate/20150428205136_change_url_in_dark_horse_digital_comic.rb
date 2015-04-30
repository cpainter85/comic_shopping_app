class ChangeUrlInDarkHorseDigitalComic < ActiveRecord::Migration
  def change
    change_column :dark_horse_digital_comics, :url, :string
  end
end
