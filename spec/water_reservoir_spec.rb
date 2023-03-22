require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

    it 'has a capacity and current volume' do
        reservoir = WaterReservoir.new
        expect(reservoir.capacity).to eq(10)
        expect(reservoir.current_water_volume).to eq(0)
    end

    it 'can tell if it is empty' do
        reservoir = WaterReservoir.new
        expect(reservoir.empty?).to eq(true)
    end

    it 'can be filled' do
        reservoir = WaterReservoir.new
        reservoir.fill
        expect(reservoir.current_water_volume).to eq(10)
    end

    it 'can be drained' do
        reservoir = WaterReservoir.new
        reservoir.fill
        reservoir.drain(3)
        expect(reservoir.current_water_volume).to eq(7)
    end

end
