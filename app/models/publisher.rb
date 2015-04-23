class Publisher < ActiveRecord::Base

  has_many :volumes, dependent: :destroy

  validates :comic_vine_pub_id, uniqueness: true

  def get_pub_info(api_key)
    comic_vine = ComicVineAPI.new
    pub = comic_vine.publisher(api_key, self.comic_vine_pub_id)['results']

    self.name = pub['name']
    self.short_description = pub['deck']
    self.full_description = pub['description']
    self.logo_url = pub['image']['small_url']
    self.logo_thumb_url = pub['image']['thumb_url']
    self.save
  end
end
