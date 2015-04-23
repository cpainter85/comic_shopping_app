class Creator < ActiveRecord::Base

  has_many :issue_credits, dependent: :destroy
  has_many :issues, through: :issue_credits

  validates :comic_vine_creator_id, uniqueness: true
end
