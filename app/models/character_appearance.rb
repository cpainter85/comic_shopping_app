class CharacterAppearance < ActiveRecord::Base
  belongs_to :issue
  belongs_to :character

  validates :issue_id, presence: true
  validates :character_id, presence: true
  validates_uniqueness_of :character_id, :scope => :issue_id
end
