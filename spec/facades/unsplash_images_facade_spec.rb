require 'rails_helper'

RSpec.describe UnsplashImagesFacade do
  describe 'self.get_images' do
    it 'returns an array of Image objects' do
      nepal_img_json = File.read('spec/fixtures/nepal_images.json')

      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['unspl_key']}&page=1&per_page=10&query=Nepal").
      with(headers: {'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'}).
      to_return(status: 200, body: nepal_img_json, headers: {})

      imgs = UnsplashImagesFacade.get_images('Nepal')

      expect(imgs).to be_an(Array)
      imgs.each do |img|
        expect(img).to be_an(Image)
      end
    end
  end
end