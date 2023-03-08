require 'rails_helper'

RSpec.describe Recipe do
  describe '#initialize' do
    it 'instantiates correctly based on given data' do
      data = { recipe: {label: "Bob", url: "1234", image: "12"}}

      r = Recipe.new(data, "Germany")

      expect(r).to be_a(Recipe)
      expect(r.title).to eq("Bob")
      expect(r.url).to eq("1234")
      expect(r.image).to eq("12")
      expect(r.id).to eq("null")
      expect(r.country).to eq("Germany")
    end
  end
end