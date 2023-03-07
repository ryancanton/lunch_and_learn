require 'rails_helper'

RSpec.describe "Learning Resources Endpoints" do
  it 'can return a learning resource json based on country paramter' do
    nepal_img_json = File.read('spec/fixtures/nepal_images.json')
    nepal_vid_json = File.read('spec/fixtures/nepal_video.json')

    stub_request(:get, "https://www.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{ENV['yt_key']}&maxResults=1&part=snippet,id&q=Nepal").
    with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4' }).
    to_return(status: 200, body: nepal_vid_json, headers: {})

    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['unspl_key']}&page=1&per_page=10&query=Nepal").
    with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'}).
    to_return(status: 200, body: nepal_img_json, headers: {})

    get '/api/v1/learning_resources?country=Nepal'
    expect(response).to be_successful

    learning_resource = JSON.parse(response.body, symbolize_names: true)

    expect(learning_resource[:data].count).to eq(3)

    lr = learning_resource[:data]
    
    expect(lr).to have_key(:id)
    expect(lr[:id]).to eq('null')

    expect(lr).to have_key(:type)
    expect(lr[:type]).to eq("learning_resource")

    expect(lr[:attributes].count).to eq(3)

    expect(lr[:attributes]).to have_key(:country)
    expect(lr[:attributes][:country]).to be_a(String)

    expect(lr[:attributes]).to have_key(:video)
    expect(lr[:attributes][:video]).to be_a(Hash)

    expect(lr[:attributes][:video]).to have_key(:title)
    expect(lr[:attributes][:video][:title]).to be_a(String)

    expect(lr[:attributes][:video]).to have_key(:youtube_video_id)
    expect(lr[:attributes][:video][:youtube_video_id]).to be_a(String)

    expect(lr[:attributes]).to have_key(:images)
    expect(lr[:attributes][:images]).to be_an(Array)

    lr[:attributes][:images].each do |image|
      expect(image).to have_key(:alt_tag)
      expect(image[:alt_tag]).to be_a(String)

      expect(image).to have_key(:url)
      expect(image[:url]).to be_a(String)
    end
    
  end
end