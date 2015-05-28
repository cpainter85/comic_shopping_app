require 'rails_helper'

describe Character do
  let(:character) { create_character }

  describe 'associations' do
    let(:publisher) { create_publisher }
    let(:volume) { create_volume(publisher) }
    let(:issue) { create_issue(volume) }
    let(:issue2) { create_issue(volume, issue_number: '2', comic_vine_issue_id: 88) }
    let!(:character_appearance) { create_character_appearance(issue, character) }
    let!(:character_appearance2) { create_character_appearance(issue2, character) }

    describe '#character_appearances' do
      it 'returns the appearances of a character' do
        expect(character.character_appearances).to eq([character_appearance, character_appearance2])
      end
    end

    describe '#issues' do
      it 'returns the issues a character appears in' do
        expect(character.issues).to eq([issue, issue2])
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of a name' do
      character.update_attributes(name: nil)
      expect(character.errors.any?).to eq(true)
      expect(character.errors.messages).to eq(name: ['can\'t be blank'])
    end

    it 'validates the presence of a comic vine id' do
      character.update_attributes(comic_vine_character_id: nil)
      expect(character.errors.any?).to eq(true)
      expect(character.errors.messages).to eq(comic_vine_character_id: ['can\'t be blank'])
    end

    it 'validates the uniqueness of a comic vine id' do
      character2 = Character.new(comic_vine_character_id: character.comic_vine_character_id, name: 'Wolverine')
      character2.save
      expect(character2.errors.any?).to eq(true)
      expect(character2.errors.messages).to eq(comic_vine_character_id: ['has already been taken'])
    end
  end
end
