require 'rails_helper'

RSpec.describe "Random Country Request" do
  it 'can return the string name of one random country' do
    
    json_response = File.read('spec/fixtures/all_countries.json')
    response_hash = JSON.parse(json_response, symbolize_names: true)
    
    stub_request(:get, "https://restcountries.com/v3.1/all").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})

    country = CountriesFacade.get_random_country.name

    country_names = response_hash.map do |country|
      country[:name][:common]
    end

    expect(country_names.include?(country)).to eq(true)
  end
end