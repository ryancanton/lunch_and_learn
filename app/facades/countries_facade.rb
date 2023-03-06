class CountriesFacade
  def self.get_random_country
    data = CountriesService.get_countries
    countries = data.map {|country| Country.new(country)}
    countries.shuffle.pop
  end
end