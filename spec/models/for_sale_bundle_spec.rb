require 'rails_helper'

describe ForSaleBundle do
  let(:publisher) { create_publisher }
  let(:volume) { create_volume(publisher) }
  let(:vendor) { create_vendor }
  let(:for_sale_bundle) { create_for_sale_bundle(volume, vendor) }

  describe 'associations' do
    describe '#volume' do
      it 'shows the volume a bundle belongs to' do
        expect(for_sale_bundle.volume).to eq(volume)
      end
    end
    describe '#vendor' do
      it 'shows the vendor selling a bundle' do
        expect(for_sale_bundle.vendor).to eq(vendor)
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of a bundle name' do
      for_sale_bundle.update_attributes(name: nil)
      expect(for_sale_bundle.errors.any?).to eq(true)
      expect(for_sale_bundle.errors.messages).to eq(name: ['can\'t be blank'])
    end
  end
end
