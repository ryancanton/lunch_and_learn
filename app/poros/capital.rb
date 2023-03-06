class Capital
  attr_reader :lon,
              :lat

  def initialize(data)
    @lon = data[0][:capitalInfo][:latlng][1]
    @lat = data[0][:capitalInfo][:latlng][0]
  end
end
