class Volume < ActiveRecord::Base

  include PgSearch

  multisearchable against: [:name, :description, :start_year, :thumbnail_url, :publisher_id]

  belongs_to :publisher
  has_many :issues, dependent: :destroy
  has_many :for_sale_bundles, dependent: :destroy

  validates :name, presence: true
  validates :comic_vine_vol_id, uniqueness: true

  def name_with_date
    "#{self.name} (#{self.start_year})"
  end

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

        creators = single['person_credits']
        creators.each do |creator|
          c = i.creators.new
          c.comic_vine_creator_id = creator['id']
          c.name = creator['name']
          if c.save
            person = comic_vine.creator(api_key, c.comic_vine_creator_id)['results']
            c.short_description = person['deck']
            c.full_description = person['description']
            person['image'] ? c.profile_picture_url = person['image']['small_url'] : nil
            person['image'] ? c.profile_picture_thumb_url = person['image']['thumb_url'] : nil
            c.save
          end

          credit = i.issue_credits.new
          credit.creator_id = Creator.find_by(comic_vine_creator_id: creator['id']).id
          credit.role = creator['role']
          credit.save
        end
      i.get_character_appearances(api_key)
      end
    end
  end
end
