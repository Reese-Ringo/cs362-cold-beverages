class Vessel
  attr_reader :name, :volume

  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @current_water_volume = 0
  end

  def fill
    @current_water_volume = @volume
  end

  def empty?
    @current_water_volume == 0
  end

end
