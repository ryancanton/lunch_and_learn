class Api::V1::LearningResourcesController < ApplicationController
  def index
    resources = LearningResourcesFacade.get_resources(params[:country])
    render json: LearningResourcesSerializer.format_resource(resources)
  end
end