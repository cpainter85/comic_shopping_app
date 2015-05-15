require 'rails_helper'

describe Creator do
  let(:creator) { create_creator }

  describe 'associations' do
    let(:publisher) { create_publisher }
    let(:volume) { create_volume(publisher) }
    let(:issue) { create_issue(volume) }
    let(:issue2) { create_issue(volume, issue_number: 2, comic_vine_issue_id: 11) }
    let!(:issue_credit) { create_issue_credit(issue, creator) }
    let!(:issue_credit2) { create_issue_credit(issue2, creator) }

    describe '#issue_credits' do
      it 'returns the issues credits for a given creator' do
        expect(creator.issue_credits).to eq([issue_credit, issue_credit2])
      end
    end

    describe '#issues' do
      it 'returns the issues a given creator worked on' do
        expect(creator.issues).to eq([issue, issue2])
      end
    end
  end

  describe 'validations' do
    it 'validates the presence of a name' do
      creator.update_attributes(name: nil)
      expect(creator.errors.any?).to eq(true)
      expect(creator.errors.messages).to eq(name: ['can\'t be blank'])
    end

    it 'validates the uniqueness of a comic vine creator id' do
      creator2 = Creator.new(name: 'Grant Morrison', comic_vine_creator_id: creator.comic_vine_creator_id)
      creator2.save
      expect(creator2.errors.any?).to eq(true)
      expect(creator2.errors.messages).to eq(comic_vine_creator_id: ['has already been taken'])
    end
  end
end
