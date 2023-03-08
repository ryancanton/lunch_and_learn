require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:api_key) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:api_key) }
  end

  describe 'self.generate_api_key' do
    it 'creates a unique api_key' do
      string = User.generate_api_key
      expect(string.length).to eq(27)
    end
  end
end