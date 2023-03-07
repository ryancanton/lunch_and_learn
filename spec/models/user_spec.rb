require 'rails_helper'

RSpec.describe User do
  describe 'self.generate_api_key' do
    it 'creates a unique api_key' do
      User.generate_api_key
    end
  end
end