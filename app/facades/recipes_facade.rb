class RecipesFacade
  def self.get_recipes(country)
    data = RecipesService.get_recipes(country)[:hits]
    data.map {|recipe| Recipe.new(recipe, country)}
  end
end