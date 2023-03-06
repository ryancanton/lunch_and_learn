require 'rails_helper'

RSpec.describe TouristSight do
  describe '#initialize' do
    it 'instantiates correctly based on given data' do
      data = { properties: {name: "Bob", formatted: "1234", place_id: "12"}}

      ts = TouristSight.new(data)

      expect(ts).to be_a(TouristSight)
      expect(ts.name).to eq("Bob")
      expect(ts.address).to eq("1234")
      expect(ts.place_id).to eq("12")
      expect(ts.id).to eq("null")
    end
  end
end