require 'rails_helper'

RSpec.describe 'Favorite Requests' do
  it 'a favorite can be created with a valid api_key via a post request' do
    user = User.create!(name: "Bob", email: "bob@email.com", api_key: "1vhsdu2gh7gfw987r")
    bad_key = "invalid_api_key"

    fav_params = {     
      api_key: bad_key,
      country: "CountryName",
      recipe_link: "recipe.com",
      recipe_title: "The Recipe"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

    post '/api/v1/favorites', headers: headers, params: JSON.generate(fav_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error_json = JSON.parse(response.body, symbolize_names: true)
    expect(error_json).to eq({:errors=>"Favorite not created: api_key invalid"})

    fav_params = {     
      api_key: user.api_key,
      country: "CountryName",
      recipe_link: "recipe.com",
      recipe_title: "The Recipe"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

    post '/api/v1/favorites', headers: headers, params: JSON.generate(fav_params)
    expect(response).to be_successful

    fav_json = JSON.parse(response.body, symbolize_names: true)
    fav = Favorite.last

    expect(fav_json).to eq({:success => "Favorite added successfully"})
    expect(fav.api_key).to eq(user.api_key)
    expect(fav.country).to eq("CountryName")
    expect(fav.recipe_link).to eq("recipe.com")
    expect(fav.recipe_title).to eq("The Recipe")
  end

  it 'a users favorite recipes can be gathered from an api key' do
    user1 = User.create!(name: "Bob", email: "bob@email.com", api_key: "1vhsdu2gh7gfw987r")
    user2= User.create!(name: "Lob", email: "lob@email.com", api_key: "2vhsdu2gh7gfw987r")
    fav1 = Favorite.create!(api_key: user1.api_key, country: "Baha", recipe_link: 'r1.com', recipe_title: "a recipe")
    fav2 = Favorite.create!(api_key: user1.api_key, country: "Waha", recipe_link: 'r2.com', recipe_title: "the recipe")
    fav3 = Favorite.create!(api_key: user2.api_key, country: "Maha", recipe_link: 'r3.com', recipe_title: "recipe")

    get "/api/v1/favorites?api_key=#{user1.api_key}"
    expect(response).to be_successful

    fav_json = JSON.parse(response.body, symbolize_names: true)
    expect(fav_json[:data].count).to eq(2)

    fav_json[:data].each do |fav|
      expect(fav[:attributes].count).to eq(5)
      expect(fav[:attributes][:api_key]).to eq(user1.api_key)
    end
  end
end