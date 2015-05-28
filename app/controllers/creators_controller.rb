class CreatorsController < ApplicationController
  def index
    @creators = Creator.all.order(:name)
  end

  def show
    @creator = Creator.find(params[:id])
  end
end
