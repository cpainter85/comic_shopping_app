class Issue < ActiveRecord::Base

  belongs_to :volume
  has_many :issue_credits, dependent: :destroy
  has_many :creators, through: :issue_credits
  has_many :for_sale_comics, dependent: :destroy
  has_many :character_appearances, dependent: :destroy
  has_many :characters, through: :character_appearances

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

  def get_character_appearances(api_key)
    comic_vine = ComicVineAPI.new
    all_appearances = comic_vine.issue(api_key, self.comic_vine_issue_id)['results']['character_credits']

    all_appearances.each do |appearance|
      character = Character.new
      character.comic_vine_character_id = appearance['id']
      character.name = appearance['name']

      if character.save
        c = comic_vine.character(api_key, character.comic_vine_character_id)['results']
        character.real_name = c['real_name']
        character.aliases = c['aliases']
        character.short_description = c['deck']
        character.full_description = c['description']
        if c['image']
          character.image_url = c['image']['small_url']
          character.thumb_url = c['image']['thumb_url']
        end
        find_publisher = Publisher.find_by(comic_vine_pub_id: c['publisher']['id'])
        character.publisher_id = find_publisher ? find_publisher.id : self.volume.publisher.id
        character.save
      end

      credit = self.character_appearances.new
      credit.character_id = Character.find_by(comic_vine_character_id: appearance['id']).id
      credit.save
    end
  end
end
