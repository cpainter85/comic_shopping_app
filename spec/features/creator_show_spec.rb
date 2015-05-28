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
    expect(page).to have_content "#{issue.full_title_with_year} - #{@issue_credit.role}"

  end

  scenario 'Can visit other comics that same creator worked on' do
    issue2 = create_issue(volume, issue_number: '2', comic_vine_issue_id: 99 )
    issue_credit2 = create_issue_credit(issue2, @creator)

    visit creator_path(@creator)

    expect(page).to have_content "Credits (#{@creator.issues.count} Issues)"

    click_link issue2.full_title_with_year

    expect(current_path).to eq publisher_volume_issue_path(publisher,volume,issue2)
  end
end
