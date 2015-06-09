class PublishersController < ApplicationController
  def show
    @publisher = Publisher.find(params[:id])
    @letters = @publisher.characters.map{|character| character.name[0]}.uniq.sort
  end
end
