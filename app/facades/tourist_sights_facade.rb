class TouristSightsFacade
  def self.get_sights(country)
    capital = CountriesFacade.get_capital(country)
    sights = TouristSightsService.get_sights(capital.lon, capital.lat)
    sights[:features].map {|sight| TouristSight.new(sight)}
  end
end