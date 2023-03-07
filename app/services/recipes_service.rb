class RecipesService
  def self.get_recipes(country)
    url = "https://api.edamam.com/api/recipes/v2?type=public&q=#{country}&app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}"
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end