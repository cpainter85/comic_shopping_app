require 'rails_helper'

feature 'Welcome Page' do

  before :each do
    @publisher = create_publisher
    @publisher2 = create_publisher(name: 'Marvel Comics', comic_vine_pub_id: 31, website: 'http//www.marvel.com', logo_url: 'http://static.site.com/marvellogo.gif', logo_thumb_url: 'http://static.site.com/marvellogo-thumb.gif')
  end

  scenario 'Welcome page lists all publishers' do

    visit root_path

    have_css("img[src='http://static.site.com/dkhlogo.gif']")
    expect(page).to have_content 'Dark Horse Comics'
    have_css("img[src='http://static.site.com/marvellogo.gif']")
    expect(page).to have_content 'Marvel Comics'
  end

end
