class Character < ActiveRecord::Base

  include PgSearch

  multisearchable against: [:name, :real_name, :aliases, :short_description, :thumb_url, :publisher_id]

  has_many :character_appearances, dependent: :destroy
  has_many :issues, through: :character_appearances
  belongs_to :publisher

  validates :name, presence: true
  validates :publisher_id, presence: true
  validates :comic_vine_character_id, presence: true, uniqueness: true

  def self.check_pub(pub_id)
    result =[]
    Publisher.find(pub_id).characters.each do |character|
      character.issues.each do |issue|
        if issue.volume.publisher.id != pub_id && !result.index(character.id)
          result.push(character.id)
        end
      end
    end
    result
  end

end
