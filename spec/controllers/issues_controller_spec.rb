require 'rails_helper'

describe IssuesController do
  let(:publisher) { create_publisher }
  let(:volume) { create_volume(publisher) }
  let(:issue) { create_issue(volume) }

  describe '#show' do
    it 'assigns issue to the corressponding issue' do
      get :show, publisher_id: publisher.id, volume_id: volume.id, id: issue.id

      expect(assigns(:issue)).to eq issue
    end
  end
end
