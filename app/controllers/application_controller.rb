class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action do
    @publishers = Publisher.all
  end

  private

  def disable_nav
    @disable_nav = true
  end

end
