class Issue < ActiveRecord::Base

  belongs_to :volume
  has_many :issue_credits
  has_many :creators, through: :issue_credits

  validates :comic_vine_issue_id, uniqueness: true

end
