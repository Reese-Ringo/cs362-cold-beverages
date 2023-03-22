require_relative '../lib/freezer'

describe 'A freezer' do

    it 'has a capacity, temperature, power status, and contents' do
        freezer = Freezer.new
        expect(freezer.capacity).to eq(100)
        expect(freezer.temperature).to eq(70)
        expect(freezer.instance_variable_get(:@power)).to eq(:off)
        expect(freezer.instance_variable_get(:@contents)).to eq([])
    end

    it 'can turn on' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.instance_variable_get(:@power)).to eq(:on)
    end

    it 'can turn off' do
        freezer = Freezer.new
        freezer.turn_on
        freezer.turn_off
        expect(freezer.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can add an item' do
        freezer = Freezer.new
        item = Item.new('FAKE', 3)
        freezer.add(item)
        array = freezer.instance_variable_get(:@contents)
        temp = array.at(0)
        expect(temp).to eq(item)
    end

    it 'can determine remaining capacity' do
        freezer = Freezer.new
        item = Item.new('FAKE', 3)
        freezer.add(item)
        expect(freezer.remaining_capacity).to eq(97)
    end

    it 'can set level' do
        freezer = Freezer.new
        freezer.set_level(1)
        expect(freezer.temperature).to eq(60)
    end


end
