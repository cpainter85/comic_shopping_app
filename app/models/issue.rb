class Issue < ActiveRecord::Base

  belongs_to :volume
  has_many :issue_credits, dependent: :destroy
  has_many :creators, through: :issue_credits
  has_many :for_sale_comics, dependent: :destroy

  validates :comic_vine_issue_id, uniqueness: true


  def full_title_with_year
    "#{self.volume.name} (#{self.volume.start_year}) \##{self.issue_number}"
  end

  def get_previous_issue
    self.volume.issues.order(:id).where('id < ?', self.id).last

  end

  def get_next_issue
    self.volume.issues.order(:id).where('id > ?', self.id).first
  end
end
