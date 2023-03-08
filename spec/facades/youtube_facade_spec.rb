require 'rails_helper'

RSpec.describe YoutubeFacade do
  describe 'self.get_video' do
    it 'returns a Video object' do
      nepal_vid_json = File.read('spec/fixtures/nepal_video.json')

      stub_request(:get, "https://www.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{ENV['yt_key']}&maxResults=1&part=snippet,id&q=Nepal").
      with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4' }).
      to_return(status: 200, body: nepal_vid_json, headers: {})

      vid = YoutubeFacade.get_video('Nepal')

      expect(vid).to be_a(Video)
    end
  end
end