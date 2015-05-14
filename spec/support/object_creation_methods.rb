def create_publisher(overrides = {})
  Publisher.create!({
    name: 'Dark Horse Comics',
    comic_vine_pub_id: 364,
    website: 'http://www.darkhorse.com',
    short_description: 'Short description about Dark Horse',
    full_description: 'Longer description',
    logo_url: 'http://static.site.com/dkhlogo.gif',
    logo_thumb_url: 'http://static.site.com/dkhlogo-thumb.gif'
  }.merge(overrides))
end

def create_volume(publisher, overrides = {})
  Volume.create!({
    name: 'Conan the Barbarian',
    publisher_id: publisher.id,
    comic_vine_vol_id: 44351,
    description: 'Description of series',
    image_url: 'http://static.site.com/conan.gif',
    thumbnail_url: 'http://static.site.com/conan-thumb.gif',
    start_year: 2012
  }.merge(overrides))
end
