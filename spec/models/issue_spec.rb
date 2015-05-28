require 'rails_helper'

describe Issue do
  let(:publisher) { create_publisher }
  let(:volume) { create_volume(publisher) }
  let(:issue) { create_issue(volume) }

  describe 'associations' do
    let(:creator) { create_creator }
    let(:creator2) { create_creator(name: 'Brian Wood', comic_vine_creator_id: 22) }
    let!(:issue_credit) { create_issue_credit(issue, creator) }
    let!(:issue_credit2) { create_issue_credit(issue, creator2) }
    let(:vendor) { create_vendor }
    let(:vendor2) { create_vendor(name: 'Comixology') }
    let(:for_sale_comic) { create_for_sale_comic(issue, vendor) }
    let(:for_sale_comic2) { create_for_sale_comic(issue, vendor2) }
    let(:character) { create_character }
    let(:character2) { create_character(name: 'Superman', comic_vine_character_id: 11)}
    let!(:character_appearance) { create_character_appearance(issue, character) }
    let!(:character_appearance2) { create_character_appearance(issue, character2) }

    describe '#volume' do
      it 'returns the volume of a given issue' do
        expect(issue.volume).to eq(volume)
      end
    end

    describe '#issue_credits' do
      it 'returns the issue credits of a given issue' do
        expect(issue.issue_credits).to eq([issue_credit, issue_credit2])
      end
    end

    describe '#creators' do
      it 'returns the creators of a given issue' do
        expect(issue.creators).to eq([creator, creator2])
      end
    end

    describe '#for_sale_comics' do
      it 'returns for sale comics of a given issue' do
        expect(issue.for_sale_comics).to eq([for_sale_comic, for_sale_comic2])
      end
    end

    describe '#character_appearances' do
      it 'returns the character appearances of a given issue' do
        expect(issue.character_appearances).to eq([character_appearance, character_appearance2])
      end
    end

    describe '#characters' do
      it 'returns the characters that appear in a given issue' do
        expect(issue.characters).to eq([character, character2])
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of a volume' do
      issue.update_attributes(volume_id: nil)
      expect(issue.errors.any?).to eq(true)
      expect(issue.errors.messages).to eq(volume_id: ['can\'t be blank'])
    end

    it 'validates the presence of an issue number' do
      issue.update_attributes(issue_number: nil)
      expect(issue.errors.any?).to eq(true)
      expect(issue.errors.messages).to eq(issue_number: ['can\'t be blank'])
    end

    it 'validates the uniqueness of the comic vine issue id' do
      issue2 = Issue.new(volume_id: volume.id, issue_number: '2', comic_vine_issue_id: issue.comic_vine_issue_id)
      issue2.save
      expect(issue2.errors.any?).to eq(true)
      expect(issue2.errors.messages).to eq(comic_vine_issue_id: ['has already been taken'])
    end
  end
end
