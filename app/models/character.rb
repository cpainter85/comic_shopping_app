class Character < ActiveRecord::Base
  has_many :character_appearances, dependent: :destroy
  has_many :issues, through: :character_appearances
end
