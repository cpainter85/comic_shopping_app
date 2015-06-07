require 'rails_helper'

describe CharactersController do
  let(:publisher) { create_publisher }
  let(:character) { create_character(publisher) }

  describe '#show' do
    it 'assigns character to the corressponding character' do
      get :show, publisher_id: publisher.id, id: character.id

      expect(assigns(:character)).to eq character
    end
  end
end
