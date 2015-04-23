class VolumesController < ApplicationController
  before_action :find_publisher, except: [:search]

  def show
    @volume = @publisher.volumes.find(params[:id])
  end

  def search
    @results = PgSearch.multisearch(params[:query])
  end

  private
  def find_publisher
    @publisher = Publisher.find(params[:publisher_id])
  end
end
