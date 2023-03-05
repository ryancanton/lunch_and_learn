class Api::V1::LearningResourcesController < ApplicationController
  def index
    if params[:country]
      recipes = RecipesFacade.get_recipes(params[:country])
    else
      recipes = RecipesFacade.get_recipes(CountriesFacade.get_random_country)
    end
    render json: RecipeSerializer.new(recipes)
  end
end