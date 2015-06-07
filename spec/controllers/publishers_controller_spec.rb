require 'rails_helper'

describe PublishersController do
  let(:publisher) { create_publisher }

  describe '#show' do
    it 'assigns publisher to the corressponding publisher' do
      get :show, id: publisher.id

      expect(assigns(:publisher)).to eq publisher
    end
  end
end
