class WelcomeController < ApplicationController

  def index
    @publishers = Publisher.all
  end
end
