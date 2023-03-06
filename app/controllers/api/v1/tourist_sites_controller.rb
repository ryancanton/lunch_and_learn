class Api::V1::LearningResourcesController < ApplicationController
  def index
    sites = TouristSitesFacade.get_sites(params[:country])
    render json: TouristSitesSerializer.new(sites)
  end
end