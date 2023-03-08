require 'rails_helper'

RSpec.describe LearningResourcesFacade do
  describe 'self.get_resources' do
    it 'returns an Learning resource containing country, yt vid, and imgs' do
      nepal_img_json = File.read('spec/fixtures/nepal_images.json')
      nepal_vid_json = File.read('spec/fixtures/nepal_video.json')

      stub_request(:get, "https://www.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{ENV['yt_key']}&maxResults=1&part=snippet,id&q=Nepal").
      with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4' }).
      to_return(status: 200, body: nepal_vid_json, headers: {})

      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['unspl_key']}&page=1&per_page=10&query=Nepal").
      with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'}).
      to_return(status: 200, body: nepal_img_json, headers: {})

      lr = LearningResourcesFacade.get_resources('Nepal')

      expect(lr).to be_a(LearningResource)
      expect(lr.country).to eq('Nepal')
      expect(lr.video).to be_a(Video)
      expect(lr.images).to be_a(Array)
      lr.images.each do |img|
        expect(img).to be_an(Image)
      end
    end
  end
end