require_relative '../lib/refrigerator'

describe 'A refrigerator' do

    

    it 'has a chiller, freezer, control panel, water dispenser, water reservoir and power status' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        expect(refrigerator.chiller).to eq(chiller)
        expect(refrigerator.freezer).to eq(freezer)
        expect(refrigerator).to respond_to(:control_panel)
        expect(refrigerator.water_dispenser).to eq(dispenser)
        expect(refrigerator.water_reservoir).to eq(reservoir)
        expect(refrigerator.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can chill an item' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        item = Item.new('FAKE', 3)        

        refrigerator.chill(item)
        array = chiller.instance_variable_get(:@contents)
        temp = array.at(0)
        expect(temp).to eq(item)
    end

    it 'can freeze an item' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        item = Item.new('FAKE', 3)        

        refrigerator.freeze(item)
        array = freezer.instance_variable_get(:@contents)
        temp = array.at(0)
        expect(temp).to eq(item)
    end

    it 'can determine its total capacity' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        item = Item.new('FAKE', 3)        

        refrigerator.freeze(item)

        expect(refrigerator.total_capacity).to eq(chiller.capacity + freezer.capacity)
    end

    it 'can determine its remaining capacity' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        item = Item.new('FAKE', 3)        

        refrigerator.freeze(item)

        expect(refrigerator.remaining_capacity).to eq(chiller.remaining_capacity + freezer.remaining_capacity)
    end

    it 'can plug in' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        refrigerator.plug_in

        expect(refrigerator.instance_variable_get(:@power)).to eq(:on)
        expect(chiller.instance_variable_get(:@power)).to eq(:on)
        expect(freezer.instance_variable_get(:@power)).to eq(:on)
    end

    it 'can unplug' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        refrigerator.plug_in
        refrigerator.unplug

        expect(refrigerator.instance_variable_get(:@power)).to eq(:off)
        expect(chiller.instance_variable_get(:@power)).to eq(:off)
        expect(freezer.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can set chiller level' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        refrigerator.set_chiller_level(1)
        expect(chiller.temperature).to eq(65)
    end

    it 'can set freezer level' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

        refrigerator.set_freezer_level(1)
        expect(freezer.temperature).to eq(60)
    end

end
