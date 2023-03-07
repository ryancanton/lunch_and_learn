require 'rails_helper'

describe "Recipes API" do
  it 'returns a formatted json of recipes based on a country param' do
    json_response = File.read('spec/fixtures/thailand_recipes.json')
    
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=e10c6149&app_key=5216c0e28198e856e7932d2f664d033c&q=thailand&type=public").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.4'
      }).
    to_return(status: 200, body: json_response, headers: {})
    
    get '/api/v1/recipes?country=thailand'

    expect(response).to be_successful
    recipes = JSON.parse(response.body, symbolize_names: true)


    expect(recipes[:data].count).to eq(20)

    recipes[:data].each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to eq('null')

      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to eq("recipe")

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

