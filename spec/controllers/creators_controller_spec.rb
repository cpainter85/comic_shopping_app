require 'rails_helper'

describe CreatorsController do
  let(:creator) { create_creator }
  let(:creator2) { create_creator(name: 'Warren Ellis') }

  describe 'GET #index' do
      it 'should assign creators object with all creators' do
        get :index

        expect(assigns(:creators)).to eq [creator, creator2]
      end
    end

  describe '#show' do
    it 'assigns creator to the corressponding creator' do
      get :show, id: creator.id

      expect(assigns(:creator)).to eq creator
    end
  end
end
