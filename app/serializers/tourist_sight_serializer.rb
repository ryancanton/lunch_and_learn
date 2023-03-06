class TouristSightSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type 'tourist_sight'
  attributes :name, :address, :place_id
end