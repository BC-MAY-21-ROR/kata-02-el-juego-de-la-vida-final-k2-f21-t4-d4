require 'rspec'
require_relative 'game'
require_relative 'grid'
require_relative 'cell'

describe Cell do
    describe '.alive?' do
        it 'return true or false' do
            expect(Cell.alive?()).to eq(false)
        end
    end
end