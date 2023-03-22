require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

    it 'has a reservoir' do
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        expect(reservoir).to eq(dispenser.reservoir)
    end

    it 'can drain a reservoir' do
        reservoir = WaterReservoir.new(10, 10) # Initialize as full
        dispenser = WaterDispenser.new(reservoir)
        vessel = Vessel.new('Bottle', 2)
        dispenser.dispense(vessel)
        expect(reservoir.current_water_volume).to eq(8)
    end
end
