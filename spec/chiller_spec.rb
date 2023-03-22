require_relative '../lib/chiller'

describe 'A chiller' do

    it 'has a capacity, temperature, power status, and contents' do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
        expect(chiller.instance_variable_get(:@power)).to eq(:off)
        expect(chiller.instance_variable_get(:@contents)).to eq([])
    end

    it 'can turn on' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.instance_variable_get(:@power)).to eq(:on)
    end

    it 'can turn off' do
        chiller = Chiller.new
        chiller.turn_on
        chiller.turn_off
        expect(chiller.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can add an item' do
        chiller = Chiller.new
        item = Item.new('FAKE', 3)
        chiller.add(item)
        array = chiller.instance_variable_get(:@contents)
        temp = array.at(0)
        expect(temp).to eq(item)
    end

    it 'can determine remaining capacity' do
        chiller = Chiller.new
        item = Item.new('FAKE', 3)
        chiller.add(item)
        expect(chiller.remaining_capacity).to eq(97)
    end

    it 'can set level' do
        chiller = Chiller.new
        chiller.set_level(1)
        expect(chiller.temperature).to eq(65)
    end

end
