class Character < ActiveRecord::Base
  has_many :character_appearances, dependent: :destroy
  has_many :issues, through: :character_appearances
  belongs_to :publisher

  validates :name, presence: true
  validates :publisher_id, presence: true
  validates :comic_vine_character_id, presence: true, uniqueness: true
end
