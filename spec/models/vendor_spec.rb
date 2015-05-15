require 'rails_helper'

describe Vendor do
  let(:vendor) { create_vendor }

  describe 'associations' do
    let(:publisher) { create_publisher }
    let(:volume) { create_volume(publisher) }
    let(:volume2) { create_volume(publisher, comic_vine_vol_id: 1, name: 'Action Philosophers')}
    let(:for_sale_bundle) { create_for_sale_bundle(volume, vendor)}
    let(:for_sale_bundle2) { create_for_sale_bundle(volume2, vendor)}
    let(:issue) { create_issue(volume) }
    let(:issue2) { create_issue(volume2, comic_vine_issue_id: 1) }
    let(:for_sale_comic) { create_for_sale_comic(issue, vendor) }
    let(:for_sale_comic2) { create_for_sale_comic(issue2, vendor) }

    describe '#for_sale_bundles' do
      it 'returns all the bundles sold by a given vendor' do
        expect(vendor.for_sale_bundles).to eq([for_sale_bundle, for_sale_bundle2])
      end
    end

    describe '#for_sale_comics' do
      it 'returns all the comics sold by a given vendor' do
        expect(vendor.for_sale_comics).to eq([for_sale_comic, for_sale_comic2])
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of a vendor name' do
      vendor.update_attributes(name: nil)
      expect(vendor.errors.any?).to eq(true)
      expect(vendor.errors.messages).to eq(name: ['can\'t be blank'])
    end
    
    it 'validates the uniqueness of a vendor name' do
      vendor2 = Vendor.new(name: vendor.name)
      vendor2.save
      expect(vendor2.errors.any?).to eq(true)
      expect(vendor2.errors.messages).to eq(name: ['has already been taken'])
    end
  end
end
