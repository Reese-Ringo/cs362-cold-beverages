class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    if vessel.volume < reservoir.current_water_volume
      vessel.fill(vessel.volume)
      reservoir.drain(vessel.volume)
    else
      vessel.fill(reservoir.current_water_volume)
      reservoir.drain(reservoir.current_water_volume)
    end
  end

end
