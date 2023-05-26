require './lib/ship'

RSpec.describe Ship do
    before do
    @cruiser = Ship.new("Cruiser", 3)
    end
    
    describe '#exists' do
        it 'exists' do
            expect(@cruiser).to be_a(Ship)
        end

        it 'has readable attributes' do
            expect(@cruiser.name).to eq("Cruiser")
            expect(@cruiser.length).to eq(3)
            expect(@cruiser.health).to eq(3)
         end
    end 

    describe '#sunk' do
        it 'can notify is ship is sunk' do
            expect(@cruiser.sunk?).to eq(false)
        end

        it 'can be sunk' do
            @cruiser.hit

            expect(@cruiser.health).to eq(2)
            
            @cruiser.hit
            @cruiser.hit

            expect(@cruiser.sunk?).to eq(true)
        end
    end
end
