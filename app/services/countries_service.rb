class CountriesService
  def self.get_countries
    url = "https://restcountries.com/v3.1/all"
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end