class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(name: params[:name], email: params[:email], api_key: User.generate_api_key)
        if user.save
            render json: UserSerializer.new(user), status: 201
        else  
            render json: {errors: "User not created: Email must be unique"}, status: 400
        end 
  end
end