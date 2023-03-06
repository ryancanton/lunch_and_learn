class Country
  attr_reader :name

  def initialize(data)
    @name = data[:name][:common].downcase
  end
end