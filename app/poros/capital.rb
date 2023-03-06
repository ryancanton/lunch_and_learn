class Capital
  attr_reader :lon,
              :lat

  def initialize(data)
    @lon = data[:capitalInfo][:latlng][1]
    @lat = data[:capitalInfo][:latlng][0]
  end
end
