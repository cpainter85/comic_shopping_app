require 'rails_helper'

feature 'Welcome Page' do

  before :each do
    @publisher = create_publisher
  end

  scenario 'Welcome page lists all publishers' do
    publisher2 = create_publisher(name: 'Marvel Comics', comic_vine_pub_id: 31, website: 'http//www.marvel.com', logo_url: 'http://static.site.com/marvellogo.gif', logo_thumb_url: 'http://static.site.com/marvellogo-thumb.gif')

    visit root_path
    expect(page).to have_css("img[src*='#{@publisher.logo_thumb_url}']")
    expect(page).to have_content @publisher.name
    expect(page).to have_css("img[src*='#{publisher2.logo_thumb_url}']")
    expect(page).to have_content publisher2.name
  end

  scenario 'Welcome page should NOT have navbar' do
    visit root_path

    expect(page).to have_no_css('nav')
  end

end
