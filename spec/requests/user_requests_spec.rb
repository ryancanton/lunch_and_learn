require 'rails_helper'

RSpec.describe "User Requests" do
  it 'can creat a user if given an unique email' do
    user_params = {
      name: 'Jane',
      email: 'jane@gmail.com'
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful

    user_json = JSON.parse(response.body, symbolize_names: true)
    user = User.last

    expect(user_json).to eq({:data=>{:id=>user.id.to_s, :type=>"user", :attributes=>{:name=>user.name, :email=>user.email, :api_key=>user.api_key}}})

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error_json = JSON.parse(response.body, symbolize_names: true)
    expect(error_json).to eq({:errors=>"User not created: Email must be unique"})
  end
end