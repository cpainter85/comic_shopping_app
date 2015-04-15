class VolumesController < ApplicationController
  before_action do
    @publisher = Publisher.find(params[:publisher_id])
  end

  def show
    @volume = @publisher.volumes.find(params[:id])
  end
end
