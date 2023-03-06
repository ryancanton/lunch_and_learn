class TouristSight
  attr_reader :name,
              :address,
              :place_id,
              :id

  def initialize(data)
    @name = data[:properties][:name]
    @address = data[:properties][:formatted]
    @place_id = data[:properties][:place_id]
    @id = 'null'
  end
end