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
