class Volume < ActiveRecord::Base

  belongs_to :publisher

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
end
