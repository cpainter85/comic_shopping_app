require 'rails_helper'

describe ForSaleComic do
  let(:publisher) { create_publisher }
  let(:volume) { create_volume(publisher) }
  let(:issue) { create_issue(volume) }
  let(:vendor) { create_vendor }
  let(:for_sale_comic) { create_for_sale_comic(issue, vendor) }

  describe 'associations' do
    describe '#issue' do
      it 'returns the issue that is for sale' do
        expect(for_sale_comic.issue).to eq(issue)
      end
    end
    describe '#vendor' do
      it 'returns the vendor that is selling the comic' do
        expect(for_sale_comic.vendor).to eq(vendor)
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of an issue id' do
      for_sale_comic.update_attributes(issue_id: nil)
      expect(for_sale_comic.errors.any?).to eq(true)
      expect(for_sale_comic.errors.messages).to eq(issue_id: ['can\'t be blank'])
    end
    it 'validates the presence of a vendor id' do
      for_sale_comic.update_attributes(vendor_id: nil)
      expect(for_sale_comic.errors.any?).to eq(true)
      expect(for_sale_comic.errors.messages).to eq(vendor_id: ['can\'t be blank'])
    end
    it 'validates the uniqueness of an issue sold by a particular vendor' do
      for_sale_comic2 = ForSaleComic.new(issue_id: for_sale_comic.issue_id, vendor_id: for_sale_comic.vendor_id)
      for_sale_comic2.save
      expect(for_sale_comic2.errors.any?).to eq(true)
      expect(for_sale_comic2.errors.messages).to eq(issue_id: ['has already been taken'])
    end
  end
end
