require 'rails_helper'

RSpec.describe LearningResource do
  describe '#initialize' do
    it 'instantiates correctly based on given data' do
      data = { id: {videoId: "12"}, snippet: {title: "Much Wow"}}
      v = Video.new(data)

      data = { urls: {raw: "url.com"}, alt_description: 'Dude be chillin'}
      imgs = [Image.new(data)]

      lr = LearningResource.new("Baha", v, imgs)

      expect(lr).to be_a(LearningResource)
      expect(lr.country).to eq('Baha')
      expect(lr.video).to be_a(Video)
      expect(lr.images).to be_a(Array)
      lr.images.each do |img|
        expect(img).to be_an(Image)
      end
    end
  end
end