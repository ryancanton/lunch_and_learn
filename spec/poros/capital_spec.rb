require 'rails_helper'

RSpec.describe Capital do
  describe '#initialize' do
    it 'instantiates correctly based on given data' do
      data = [{capitalInfo: {latlng: [12.0, 9.0]}}]

      cap = Capital.new(data)

      expect(cap).to be_a(Capital)
      expect(cap.lon).to eq(9.0)
      expect(cap.lat).to eq(12.0)
    end
  end
end