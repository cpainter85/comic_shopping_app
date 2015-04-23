class Issue < ActiveRecord::Base

  belongs_to :volume
  has_many :issue_credits, dependent: :destroy
  has_many :creators, through: :issue_credits

  validates :comic_vine_issue_id, uniqueness: true


  def full_title_with_year
    "#{self.volume.name} (#{self.volume.start_year}) \##{self.issue_number}"
  end
end
