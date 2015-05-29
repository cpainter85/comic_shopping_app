require 'rails_helper'

describe CharacterAppearance do
  let(:publisher) { create_publisher }
  let(:volume) { create_volume(publisher) }
  let(:issue) { create_issue(volume) }
  let(:character) { create_character(publisher) }
  let(:character_appearance) { create_character_appearance(issue, character)}

  describe 'associations' do
    describe '#character' do
      it 'returns the character an appearance belongs to' do
        expect(character_appearance.character).to eq(character)
      end
    end
    describe '#issue' do
      it 'returns the issue of the appearance' do
        expect(character_appearance.issue).to eq(issue)
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of an issue id' do
      character_appearance.update_attributes(issue_id: nil)
      expect(character_appearance.errors.any?).to eq(true)
      expect(character_appearance.errors.messages).to eq(issue_id: ['can\'t be blank'])
    end
    it 'validates the presence of a character id' do
      character_appearance.update_attributes(character_id: nil)
      expect(character_appearance.errors.any?).to eq(true)
      expect(character_appearance.errors.messages).to eq(character_id: ['can\'t be blank'])
    end
    it 'prevents duplicates from saving' do
      character_appearance2 = CharacterAppearance.new(issue_id: character_appearance.issue.id, character_id: character_appearance.character.id)
      character_appearance2.save
      expect(character_appearance2.errors.any?).to eq(true)
      expect(character_appearance2.errors.messages).to eq(character_id: ['has already been taken'])
    end
  end
end
