require 'rails_helper'

RSpec.describe Video do
  describe '#initialize' do
    it 'instantiates correctly based on given data' do
      data = { id: {videoId: "12"}, snippet: {title: "Much Wow"}}

      v = Video.new(data)

      expect(v).to be_a(Video)
      expect(v.youtube_video_id).to eq("12")
      expect(v.title).to eq("Much Wow")
    end
  end
end