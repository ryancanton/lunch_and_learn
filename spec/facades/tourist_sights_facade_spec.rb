require 'rails_helper'

RSpec.describe TouristSightsFacade do
  describe 'self.get_sights' do
    it 'returns an array of TouristSight objects' do
      italy_json = File.read('spec/fixtures/italy_info.json')
      sights_json = File.read('spec/fixtures/rome_sights.json')

      stub_request(:get, "https://restcountries.com/v3.1/name/Italy")
          .with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'})
      .to_return(status: 200, body: italy_json, headers: {})
      
      stub_request(:get, "https://api.geoapify.com/v2/places?apiKey=#{ENV['apiKey']}&categories=tourism.sights&filter=circle:12.48,41.9,20000&limit=20")
          .with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'})
      .to_return(status: 200, body: sights_json, headers: {})

      sights = TouristSightsFacade.get_sights('Italy')

      sights.each do |sight|
        expect(sight).to be_a(TouristSight)
      end
    end
  end
end