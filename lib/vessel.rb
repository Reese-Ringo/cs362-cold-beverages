class Vessel
  attr_reader :name, :volume, :current_water_volume

  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @current_water_volume = 0
  end

  def fill(amount)
    @current_water_volume += amount
  end

  def empty?
    @current_water_volume == 0
  end

end
