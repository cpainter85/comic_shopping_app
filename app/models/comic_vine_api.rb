class ComicVineAPI
  def initialize
    @conn = Faraday.new(:url => 'http://www.comicvine.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def publisher(api_key, comic_vine_id)
    response = @conn.get("/api/publisher/4010-#{comic_vine_id}/?api_key=#{api_key}&format=json")
    JSON.parse(response.body)
  end

  def volume(api_key, comic_vine_id)
    response = @conn.get("/api/volume/4050-#{comic_vine_id}/?api_key=#{api_key}&format=json")
    JSON.parse(response.body)
  end

  def issue(api_key, comic_vine_id)
    response = @conn.get("/api/issue/4000-#{comic_vine_id}/?api_key=#{api_key}&format=json")
    JSON.parse(response.body)
  end

  def creator(api_key, comic_vine_id)
    response = @conn.get("/api/person/4040-#{comic_vine_id}/?api_key=#{api_key}&format=json")
    JSON.parse(response.body)
  end
end
