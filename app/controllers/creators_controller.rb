class CreatorsController < ApplicationController
  def index
    @creators = Creator.all.order(:name)
    @letters = Creator.all.map{|creator| creator.name[0]}.uniq.sort
  end

  def show
    @creator = Creator.find(params[:id])
  end
end
