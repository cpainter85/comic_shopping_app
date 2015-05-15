class IssueCredit < ActiveRecord::Base
  belongs_to :issue
  belongs_to :creator

  validates :issue_id, presence: true
  validates :creator_id, presence: true
  validates_uniqueness_of :creator_id, :scope => [:issue_id, :role]

end
