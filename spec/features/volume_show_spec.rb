require 'rails_helper'

feature 'Volume show page' do
  scenario 'Can visit volume show page from publisher page' do
    publisher = create_publisher
    volume = create_volume(publisher)
    issue = create_issue(volume)
    issue2 = create_issue(volume, issue_number: '2', comic_vine_issue_id: 10, description: 'issue 2 description', story_name: 'The Death')
    vendor = create_vendor
    vendor2 =  create_vendor(name: 'Comixology')
    bundle = create_for_sale_bundle(volume, vendor)
    bundle2 = create_for_sale_bundle(volume, vendor2, price_in_cents: 1199)
    bundle3 = create_for_sale_bundle(volume, vendor, name: 'Conan the Barbarian # 7-12 Bundle', price_in_cents: 1299)

    visit publisher_path(publisher)
    click_on volume.name
    expect(current_path).to eq publisher_volume_path(publisher, volume)

    expect(page).to have_content volume.name
    expect(page).to have_content volume.description
    expect(page).to have_css("img[src*='#{volume.image_url}']")
    expect(page).to have_content "List of Issues (#{volume.issues.count} Issues)"
    expect(page).to have_content "Issue ##{issue.issue_number} - #{issue.story_name}"
    expect(page).to have_content "Issue ##{issue2.issue_number} - #{issue2.story_name}"
    expect(page).to have_content "View other volumes by #{publisher.name}"
    expect(page).to have_content "Purchase a bundle of issues # 1-6 for $9.99 at #{vendor.name}"
    expect(page).to have_content "Purchase a bundle of issues # 1-6 for $11.99 at #{vendor2.name}"
    expect(page).to have_content "Purchase a bundle of issues # 7-12 for $12.99 at #{vendor.name}"

  end
end
