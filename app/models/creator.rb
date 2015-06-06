class Creator < ActiveRecord::Base

  include PgSearch

  multisearchable against: [:name, :short_description, :profile_picture_thumb_url]

  has_many :issue_credits, dependent: :destroy
  has_many :issues, through: :issue_credits

  validates :name, presence: true
  validates :comic_vine_creator_id, uniqueness: true
end
