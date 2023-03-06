class TouristSightsService

  def self.get_sights(lon, lat)
    url = "https://api.geoapify.com/v2/places?categories=tourism.sights&filter=circle:#{lon},#{lat},20000&limit=20&apiKey=#{ENV['apiKey']}"
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end