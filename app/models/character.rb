class Character < ActiveRecord::Base
  has_many :character_appearances, dependent: :destroy
  has_many :issues, through: :character_appearances

  validates :name, presence: true
  validates :comic_vine_character_id, presence: true, uniqueness: true
end
