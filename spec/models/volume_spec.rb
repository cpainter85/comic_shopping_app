require 'rails_helper'

describe Volume do
  let(:publisher) { create_publisher }
  let(:volume) { create_volume(publisher) }

  describe 'associations' do
    let(:issue) { create_issue(volume) }
    let(:issue2) { create_issue(volume, issue_number: 2, comic_vine_issue_id: 11) }
    let(:vendor) { create_vendor }
    let(:bundle) { create_for_sale_bundle(volume, vendor) }
    let(:bundle2) { create_for_sale_bundle(volume, vendor, name: 'Conan the Barbarian #7-12 Bundle') }

    describe '#publisher' do
      it 'returns the publisher of a given volume' do
        expect(volume.publisher).to eq(publisher)
      end
    end

    describe '#issues' do
      it 'returns the issues for a given volume' do
        expect(volume.issues).to eq([issue, issue2])
      end
    end

    describe '#for_sale_bundles' do
      it 'returns the bundles on sale for a given volume' do
        expect(volume.for_sale_bundles).to eq([bundle, bundle2])
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of a volume name' do
      volume.update_attributes(name: nil)
      expect(volume.errors.any?).to eq(true)
      expect(volume.errors.messages).to eq(name: ['can\'t be blank'])
    end

    it 'validates the uniqueness of the comic vine volume id' do
      volume2 = Volume.new(name: 'Archie Vs. Predator', comic_vine_vol_id: volume.comic_vine_vol_id)
      volume2.save

      expect(volume2.errors.any?).to eq(true)
      expect(volume2.errors.messages).to eq({comic_vine_vol_id: ['has already been taken']})
    end

  end
end
