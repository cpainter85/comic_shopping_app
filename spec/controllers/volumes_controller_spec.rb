require 'rails_helper'

describe VolumesController do
  let(:publisher) { create_publisher }
  let(:volume) { create_volume(publisher) }

  describe '#show' do
    it 'assigns volume to the corressponding volume' do
      get :show, publisher_id: publisher.id, id: volume.id

      expect(assigns(:volume)).to eq volume
    end
  end
end
