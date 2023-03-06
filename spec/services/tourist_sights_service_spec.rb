require 'rails_helper'

RSpec.describe TouristSightsService do
  describe 'self.get_sights' do
    it 'returns a parsed json of tourist sites based on lon and lat values' do
      sights_json = File.read('spec/fixtures/rome_sights.json')

      stub_request(:get, "https://api.geoapify.com/v2/places?apiKey=#{ENV['apiKey']}&categories=tourism.sights&filter=circle:12.48,41.9,20000&limit=20")
         .with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'})
      .to_return(status: 200, body: sights_json, headers: {})
      
      response = TouristSightsService.get_sights(12.48, 41.9)

      expect(response).to eq(JSON.parse(sights_json, symbolize_names: true))
    end
  end
end