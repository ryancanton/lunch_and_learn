require 'rails_helper'

RSpec.describe Country do
  describe '#initialize' do
    it 'instantiates correctly based on given data' do
      data = { name: {common: "Bob"}}

      c = Country.new(data)

      expect(c).to be_a(Country)
      expect(c.name).to eq("bob")
    end
  end
end