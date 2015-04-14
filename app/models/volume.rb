class Volume < ActiveRecord::Base

  belongs_to :publisher
  has_many :issues

  validates :comic_vine_vol_id, uniqueness: true

  def get_vol_info(api_key)
    comic_vine = ComicVineAPI.new
    volume = comic_vine.volume(api_key, self.comic_vine_vol_id)['results']

    self.name = volume['name']
    self.description = volume['description']
    self.image_url = volume['image']['small_url']
    self.thumbnail_url = volume['image']['thumb_url']
    self.start_year = volume['start_year'].to_i
    self.save
  end

  def get_issues(api_key)
    comic_vine = ComicVineAPI.new
    all_issues = comic_vine.volume(api_key, self.comic_vine_vol_id)['results']['issues']

    all_issues.each do |issue|
      i = self.issues.new

      i.comic_vine_issue_id = issue['id']
      i.issue_number = issue['issue_number']
      i.story_name = issue['name']
      if i.save
        single = comic_vine.issue(api_key, i.comic_vine_issue_id)['results']
        i.description = single['description']
        single['image'] ? i.cover_image_url = single['image']['small_url'] : nil
        single['image'] ? i.thumbnail_url = single['image']['thumb_url'] : nil
        i.cover_date = single['cover_date']
        i.save
      end
    end
  end
end
