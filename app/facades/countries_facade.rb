class CountriesFacade
  def self.get_random_country
    data = CountriesService.get_countries
    countries = data.map {|country| Country.new(country)}
    countries.shuffle.pop.name
  end

  def self.get_capital(country)
    data = CountryService.get_country(country)
    capital = Capital.new(capital)
  end
end