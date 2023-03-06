require 'rails_helper'

RSpec.describe "Tourist Sights Request" do
  it 'can return a list of tourist sights based on country param' do
    italy_json = File.read('spec/fixtures/italy_info.json')
    sights_json = File.read('spec/fixtures/rome_sights.json')

    stub_request(:get, "https://restcountries.com/v3.1/name/Italy")
         .with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'})
    .to_return(status: 200, body: italy_json, headers: {})
    
    stub_request(:get, "https://api.geoapify.com/v2/places?apiKey=#{ENV['apiKey']}&categories=tourism.sights&filter=circle:12.48,41.9,20000&limit=20")
         .with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'})
    .to_return(status: 200, body: sights_json, headers: {})

    
    get '/api/v1/tourist_sights?country=Italy'

    expect(response).to be_successful
    sights = JSON.parse(response.body, symbolize_names: true)
    
    expect(sights[:data].count).to eq(20)

    sights[:data].each do |sight|
      expect(sight).to have_key(:id)
      expect(sight[:id]).to eq('null')

      expect(sight).to have_key(:type)
      expect(sight[:type]).to eq("tourist_sight")

      expect(sight[:attributes].count).to eq(3)

      expect(sight[:attributes]).to have_key(:name)
      expect(sight[:attributes][:name]).to be_a(String)

      expect(sight[:attributes]).to have_key(:address)
      expect(sight[:attributes][:address]).to be_a(String)

      expect(sight[:attributes]).to have_key(:place_id)
      expect(sight[:attributes][:place_id]).to be_a(String)
    end
  end
end