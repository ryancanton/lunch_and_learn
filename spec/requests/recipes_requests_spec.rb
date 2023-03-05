require 'rails_helper'

describe "Recipes API" do
  it 'returns a formatted json of recipe based on a country param' do
    get '/api/v1/learning_resources?country=thailand'

    expect(response).to be_successful
    recipes = JSON.parse(response.body, symbolize_names: true)


    expect(recipes[:data].count).to eq(5)

    recipes[:data].each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to eq(null)

      expect(recipe).to have_key(:type)
      expect(recipe[:id]).to eq("recipe")

      expect(recipe[:attributes].count).to eq(4)

      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes][:title]).to be_a(String)

      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes][:url]).to be_a(String)

      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes][:country]).to be_a(String)

      expect(recipe[:attributes]).to have_key(:image)
      expect(recipe[:attributes][:image]).to be_an(String)
    end
  end
end

