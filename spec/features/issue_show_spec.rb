require 'rails_helper'

feature 'Issue show page' do
  let(:publisher) {create_publisher}
  let(:volume) {create_volume(publisher)}
  let!(:issue) {create_issue(volume)}
  let(:vendor)  {create_vendor}
  let(:vendor2) { create_vendor(name: 'Comixology')}
  let!(:for_sale_comic) { create_for_sale_comic(issue, vendor)}
  let!(:for_sale_comic2) { create_for_sale_comic(issue, vendor2)}
  let!(:creator) {create_creator}
  let!(:issue_credit) {create_issue_credit(issue, creator)}
  let(:character) { create_character(publisher, name: 'Wolverine') }
  let!(:character_appearance) { create_character_appearance(issue, character)}

  scenario 'Can visit issue show page from volume page' do
    visit publisher_volume_path(publisher, volume)
    click_on "Issue ##{issue.issue_number}"
    expect(current_path).to eq publisher_volume_issue_path(publisher, volume, issue)

    expect(page).to have_content "#{issue.volume.name} # #{issue.issue_number}"
    expect(find_link(issue.volume.name)[:href]).to eq(publisher_volume_path(publisher, volume))
    expect(page).to have_css("img[src*='#{issue.cover_image_url}']")
    expect(page).to have_content issue.description
    expect(page).to have_content "#{creator.name} - #{issue_credit.role}"
    expect(page).to have_content character.name
    expect(page).to have_content "Cover Date: #{issue.cover_date.strftime('%B %Y')}"
    expect(page).to have_content "Available for Purchase at #{vendor.name} for $#{for_sale_comic.price_in_cents.to_f/100}"
    expect(page).to have_content "Available for Purchase at #{vendor2.name} for $#{for_sale_comic2.price_in_cents.to_f/100}"
    expect(find_link('Return to Volume Overview')[:href]).to eq(publisher_volume_path(publisher, volume))
  end


end
