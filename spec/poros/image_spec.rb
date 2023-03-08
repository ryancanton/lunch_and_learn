require 'rails_helper'

RSpec.describe Image do
  describe '#initialize' do
    it 'instantiates correctly based on given data' do
      data = { urls: {raw: "url.com"}, alt_description: 'Dude be chillin'}

      img = Image.new(data)

      expect(img).to be_an(Image)
      expect(img.alt_tag).to eq("Dude be chillin")
      expect(img.url).to eq("url.com")
    end
  end
end