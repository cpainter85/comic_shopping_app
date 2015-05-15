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

def create_issue(volume, overrides={})
  Issue.create!({
    volume_id: volume.id,
    issue_number: '1',
    comic_vine_issue_id: 314965,
    description: 'Issue description',
    cover_image_url: 'http://static.site.com/conan1.gif',
    thumbnail_url: 'http://static.site.com/conan1-thumb.gif',
    story_name: 'Queen of the Black Coast Part 1',
    cover_date: '2012-02-01'
  }.merge(overrides))
end

def create_vendor(overrides={})
  Vendor.create!({
    name: 'Dark Horse Digital',
    website: 'https://digital.darkhorse.com/'
  }.merge(overrides))
end

def create_for_sale_bundle(volume, vendor, overrides={})
  ForSaleBundle.create!({
    volume_id: volume.id,
    vendor_id: vendor.id,
    price_in_cents: 999,
    url: 'http://www.comicsforsale.com/conan-bundle',
    name: 'Conan The Barbarian # 1-6 Bundle'
  }.merge(overrides))
end
