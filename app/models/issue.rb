class Issue < ActiveRecord::Base

  belongs_to :volume

  validates :comic_vine_issue_id, uniqueness: true

end
