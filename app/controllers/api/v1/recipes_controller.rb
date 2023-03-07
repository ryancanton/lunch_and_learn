class Api::V1::RecipesController < ApplicationController
  def index
    if !params[:country]
      country = CountriesFacade.get_random_country
    else
      country = params[:country]
    end
    recipes = RecipesFacade.get_recipes(country)
    render json: RecipeSerializer.new(recipes)
  end
end