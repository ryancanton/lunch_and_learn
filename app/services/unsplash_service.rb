class UnsplashService
  def self.get_images(term)
    url = "https://api.unsplash.com/search/photos?client_id=#{ENV['unspl_key']}&page=1&per_page=10&query=#{term}"
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end