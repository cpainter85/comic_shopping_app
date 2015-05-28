require 'rails_helper'

feature 'Creator show page' do
  let(:publisher) {create_publisher}
  let(:volume) {create_volume(publisher)}
  let(:issue) {create_issue(volume)}

  before :each do
    @creator = create_creator
    @issue_credit = create_issue_credit(issue, @creator)
  end

  scenario 'Can visit creator show page from issue show page' do
    visit publisher_volume_issue_path(publisher, volume, issue)

    click_link @creator.name

    expect(current_path).to eq creator_path(@creator)

    expect(page).to have_content @creator.name
    expect(page).to have_content @creator.short_description
    expect(page).to have_css("img[src*='#{@creator.profile_picture_url}']")
    expect(page).to have_content "Credits (#{@creator.issues.count} Issue)"

  end
end
