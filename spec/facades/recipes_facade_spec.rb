require 'rails_helper'

RSpec.describe TouristSightsFacade do
  describe 'self.get_recipes' do
    it 'returns an array of Recipe objects' do
      json_response = File.read('spec/fixtures/thailand_recipes.json')
    
      stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}&q=thailand&type=public").
      with( headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'}).
      to_return(status: 200, body: json_response, headers: {})

      recipes = RecipesFacade.get_recipes('thailand')

      expect(recipes).to be_an(Array)

      recipes.each do |r|
        expect(r).to be_a(Recipe)
      end
    end
  end
end