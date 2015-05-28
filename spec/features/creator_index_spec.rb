require 'rails_helper'

feature 'Creators index page' do
  scenario 'From Welcome Page can browse all creators' do
    creator = create_creator
    creator2 = create_creator(comic_vine_creator_id: 33, name: 'Brian Wood')

    visit root_path
    click_link 'Browse All Creators'

    expect(current_path).to eq creators_path

    expect(page).to have_content creator.name
    expect(page).to have_content creator2.name
  end

  scenario 'Clicking on creator name takes user to creator show page' do
    creator = create_creator
    visit creators_path

    click_link creator.name

    expect(current_path).to eq creator_path(creator)
  end
end
