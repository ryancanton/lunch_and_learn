# ## Set Up Instructions:

# 1. Create a branch off of your Lunch and Learn project as directed by your instructors (eg, "final" or "retake")
# 2. As you work, you should commit to this branch every 15 minutes.
# 3. DO NOT push your code to your GitHub repo until the end of the 3 hour assessment, unless otherwise directed by instructors
# 4. Complete the user story below. You should:
#   - TDD all of your work
#   - Prioritize getting your code functional before attempting any refactors
#   - Write/refactor your code to achieve good code quality

# ## Assignment

# You will be using the "Places API" to search for tourist sights based on the capital city of the country that is provided by the user. Presume that your user will give a valid country. (you can handle edge cases later)

# Your endpoint should follow this format:

# GET /api/v1/tourist_sights?country=France

# Please do not deviate from the names of the endpoint or query parameters. Be sure it is called "tourist_sights" and "country", respectively.
# Your API will return:

# - A collection of all found tourist sights within a 20000 meter radius of the capital city.
# - Each sight should list its: 
#   - name
#   - formatted address
#   - place_id (also from the Place API)

# Your response should be in the format below:

# {
#     "data": [
#         {
#             "id": null,
#             "type": "tourist_sight",
#             "attributes": {
#                 "name": "Tour de l'horloge",
#                 "address": "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
#                 "place_id": "51d28..."
#             }
#         },
#         {
#             "id": null,
#             "type": "tourist_sight",
#             "attributes": {
#                 "name": "Le Château",
#                 "address": "Le Château, D 18, 23150 Ahun, France",
#                 "place_id": "51934..."
#             }
#         },
#         {
#             "id": null,
#             "type": "tourist_sight",
#             "attributes": {
#                 "name": "Le Chapître",
#                 "address": "Le Chapître, Rue du Chapitre, 23200 Aubusson, France",
#                 "place_id": "517182..."
#             }
#         },
#         ...,
#         ...,
#     ]
# }

# Notes: 
# 1. You will need to use the RESTful Countries API to identify the lat and long of the capital city for the provided country.
# 2. For the Places API, use the circle radius, and the tourism:sights category
# 3. You are expected to test ALL code that you write.
# 4. You are expected to commit at least once every 15 minutes or so.
# 5. Do not make a PR until we tell you to. (around 11:50am MT)
# 6. Take a deep breath, you've got this.

require 'rails_helper'

RSpec.describe "Tourist Sights Request" do
  it 'can return a list of tourist sights based on country param' do

    italy_json = File.read('spec/fixtures/italy_info.json')
    sights_json = File.read('spec/fixtures/rome_sights.json')

    stub_request(:get, "https://restcountries.com/v3.1/name/Italy").
         with(
           headers: {
       	  'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'
           }).to_return(status: 200, body: italy_json, headers: {})
    
    stub_request(:get, "https://api.geoapify.com/v2/places?apiKey=e3a2e07500244eeeb56372eb2aedd838&categories=tourism.sights&filter=circle:12.48,41.9,20000&limit=20").
         with(
           headers: {
       	  'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3','User-Agent'=>'Faraday v2.7.4'
           }).to_return(status: 200, body: sights_json, headers: {})

    get '/api/v1/tourist_sights?country=Italy'

    expect(response).to be_successful
    sights = JSON.parse(response.body, symbolize_names: true)
  end
end