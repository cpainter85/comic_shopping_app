require 'rails_helper'

describe Publisher do
  let(:publisher) { create_publisher }

  describe 'associations' do
    let(:volume) { create_volume(publisher) }
    let(:volume2) { create_volume(publisher, name: 'Action Philosophers', comic_vine_vol_id: '555') }
    describe '#volume' do
      it 'returns the volumes for a given publisher' do
        expect(publisher.volumes).to eq([volume, volume2])
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of a name for a publisher' do
      publisher.update_attributes(name: nil)
      expect(publisher.errors.any?).to eq(true)
      expect(publisher.errors.messages).to eq({name: ['can\'t be blank']})
    end

    it 'validates the uniqueness of a name' do

      publisher2 = Publisher.new(name: publisher.name)
      publisher2.save

      expect(publisher2.errors.any?).to eq(true)
      expect(publisher2.errors.messages).to eq({name: ['has already been taken']})
    end

    it 'validates the uniqueness of the comic_vine_pub_id' do
      publisher2 = Publisher.new(name: 'DC Comics', comic_vine_pub_id: publisher.comic_vine_pub_id)
      publisher2.save

      expect(publisher2.errors.any?).to eq(true)
      expect(publisher2.errors.messages).to eq({comic_vine_pub_id: ['has already been taken']})
    end
  end
end
