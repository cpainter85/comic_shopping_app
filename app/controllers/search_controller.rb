class SearchController < ApplicationController
  def search
    @results = PgSearch.multisearch(params[:query])
  end
end
