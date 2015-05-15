require 'rails_helper'

describe IssueCredit do
  let(:publisher) { create_publisher }
  let(:volume) { create_volume(publisher) }
  let(:issue) { create_issue(volume) }
  let(:creator) { create_creator }
  let(:issue_credit) { create_issue_credit(issue, creator) }

  describe 'associations' do
    describe '#issue' do
      it 'returns the issue the issue credit belongs to' do
        expect(issue_credit.issue).to eq(issue)
      end
    end
    describe '#creator' do
      it 'returns the creator the issue credit belongs to' do
        expect(issue_credit.creator).to eq(creator)
      end
    end
  end

  describe 'validations' do
    it 'validates the uniqueness of a creator scoped to issue id and role' do
      issue_credit2 = IssueCredit.new(creator_id: issue_credit.creator_id, issue_id: issue_credit.issue_id, role: issue_credit.role)
      issue_credit2.save

      expect(issue_credit2.errors.any?).to eq(true)
      expect(issue_credit2.errors.messages).to eq({creator_id: ['has already been taken']})
    end
    it 'validates the presence of an issue id' do
      issue_credit.update_attributes(issue_id: nil)
      expect(issue_credit.errors.any?).to eq(true)
      expect(issue_credit.errors.messages).to eq(issue_id: ['can\'t be blank'])
    end
    it 'validates the presence of a creator id' do
      issue_credit.update_attributes(creator_id: nil)
      expect(issue_credit.errors.any?).to eq(true)
      expect(issue_credit.errors.messages).to eq(creator_id: ['can\'t be blank'])
    end
  end
end
