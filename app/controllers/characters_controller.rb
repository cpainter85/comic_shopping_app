class CharactersController < ApplicationController
  before_action do
    @publisher = Publisher.find(params[:publisher_id])
  end

  def show
    @character = @publisher.characters.find(params[:id])
  end
end
