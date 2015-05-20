class Issue < ActiveRecord::Base

  belongs_to :volume
  has_many :issue_credits, dependent: :destroy
  has_many :creators, through: :issue_credits
  has_many :for_sale_comics, dependent: :destroy

  validates :volume_id, presence: true
  validates :issue_number, presence: true
  validates :comic_vine_issue_id, uniqueness: true

  def description_without_cover_info
    if self.description.include? '<h4>'
      self.description.slice(0...self.description.index('<h4>'))
    else
      self.description
    end
  end

  def full_title_with_year
    "#{self.volume.name} (#{self.volume.start_year}) \##{self.issue_number}"
  end

  def full_title_without_year
    "#{self.volume.name} \##{self.issue_number}"
  end

  def get_previous_issue
    # self.volume.issues.order(:id).where('id < ?', self.id).last
    self.volume.issues.select{|issue| issue.issue_number.to_f < self.issue_number.to_f}.sort {|a,b| a.issue_number.to_f <=> b.issue_number.to_f}.last;
  end

  def get_next_issue
    # self.volume.issues.order(:id).where('id > ?', self.id).first
    self.volume.issues.select{|issue| issue.issue_number.to_f > self.issue_number.to_f}.sort {|a,b| a.issue_number.to_f <=> b.issue_number.to_f}.first;
  end
end
