def create_publisher(overrides = {})
  Publisher.create!({
    name: 'Dark Horse Comics',
    comic_vine_pub_id: rand(1..1000),
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
    comic_vine_vol_id: rand(1..1000),
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
    comic_vine_issue_id: rand(1..1000),
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

def create_creator(overrides={})
  Creator.create!({
    name: 'Becky Cloonan',
    comic_vine_creator_id: rand(1..1000),
    short_description: 'short description',
    full_description: 'long description',
    profile_picture_url: 'http://static.page.com/beckycloonan.gif',
    profile_picture_thumb_url: 'http://static.page.com/beckycloonan-thumb.gif'
  }.merge(overrides))
end

def create_issue_credit(issue, creator, overrides={})
  IssueCredit.create!({
    issue_id: issue.id,
    creator_id: creator.id,
    role: 'artist'
  }.merge(overrides))
end

def create_for_sale_comic(issue, vendor, overrides={})
  ForSaleComic.create!({
    issue_id: issue.id,
    vendor_id: vendor.id,
    url: 'http://www.comicsforsale.com/conan.html',
    price_in_cents: 199
  }.merge(overrides))
end

def create_character(publisher, overrides={})
  Character.create!({
    name: 'Conan',
    real_name: 'Conan',
    aliases: 'Conan the Barbarian\nAmra the Lion\nConan the Cimmerian\nKing Conan',
    comic_vine_character_id: rand(1..1000),
    short_description: 'short description of Conan',
    full_description: 'long description of Conan',
    image_url: 'http://static.site.com/conan.jpg',
    thumb_url: 'http://static.site.com/conan-thumb.jpg',
    publisher_id: publisher.id
  }.merge(overrides))
end

def create_character_appearance(issue, character)
  CharacterAppearance.create!({
    issue_id: issue.id,
    character_id: character.id
    })
end
