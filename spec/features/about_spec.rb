require 'rails_helper'

feature 'About Page' do
  scenario 'Can reach about page from the welcome page' do
    visit root_path
    expect(page).to have_content 'For more information, visit our About Page'
    click_link 'About Page'
    expect(current_path).to eq about_path

    expect(page).to have_content 'About'
    expect(page).to have_content 'Frequently Asked Questions'
  end

  scenario 'Can reach about page from navbar' do
    publisher = create_publisher
    visit publisher_path(publisher)

    click_link 'About'
    expect(current_path).to eq about_path
    expect(page).to have_content 'About'
    expect(page).to have_content 'Frequently Asked Questions'
  end
end
