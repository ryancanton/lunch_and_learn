class Api::V1::FavoritesController < ApplicationController
  def create
    if User.where('api_key = ?', params[:api_key]) != []
      favorite = Favorite.create(favorite_params)
      render json: FavoriteSerializer.new(favorite)
    else
      render json: {errors: "Favorite not created: api_key invalid"}, status: 400
    end
  end

  private
  def favorite_params
    params.permit(:api_key, :country, :recipe_link, :recipe_title)
  end
end