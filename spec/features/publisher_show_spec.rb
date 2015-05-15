require 'rails_helper'

feature 'Publisher show page' do

  before :each do
    @publisher = create_publisher
  end

  scenario 'Can visit publisher show page from welcome page' do
    volume = create_volume(@publisher)
    volume2 = create_volume(@publisher, name: 'Action Philosophers', comic_vine_vol_id: 1, start_year: 2014, thumbnail_url: 'http://static.site.com/actionphilosophers-thumb.gif')

    visit root_path
    click_on @publisher.name
    expect(current_path).to eq publisher_path(@publisher)

    expect(page).to have_content @publisher.name
    expect(page).to have_content @publisher.short_description
    expect(page).to have_content @publisher.website
    expect(page).to have_css("img[src*='#{@publisher.logo_url}']")
    expect(page).to have_content volume.name_with_date
    expect(page).to have_css("img[src*='#{volume.thumbnail_url}']")
    expect(page).to have_content volume2.name_with_date
    expect(page).to have_css("img[src*='#{volume2.thumbnail_url}']")

  end

  scenario 'Can visit a different publisher show page using the navbar' do
    publisher2 = create_publisher(name: 'Marvel Comics', comic_vine_pub_id: 1, website: 'http://www.marvel.com', short_description: 'marvel description', logo_url: 'http://static.site.com/marvel-logo.gif')
    volume3 = create_volume(publisher2, name: 'Avengers', comic_vine_vol_id: 2, start_year: 2013, thumbnail_url: 'http://static.site.com/avengers-thumb.gif')

    visit publisher_path(@publisher)

    within('.dropdown-menu') { click_link publisher2.name }
    expect(current_path).to eq publisher_path(publisher2)

    expect(page).to have_content publisher2.name
    expect(page).to have_content publisher2.short_description
    expect(page).to have_content publisher2.website
    expect(page).to have_css("img[src*='#{publisher2.logo_url}']")
    expect(page).to have_content volume3.name_with_date
    expect(page).to have_css("img[src*='#{volume3.thumbnail_url}']")

  end
end
