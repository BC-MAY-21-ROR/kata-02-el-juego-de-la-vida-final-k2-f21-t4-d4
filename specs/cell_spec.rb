require 'rspec'
require_relative '../game/cell.rb'

describe Cell do
    it "print new live cell" do 
        cell = Cell.new(1)
        expect(cell.state).to eq "*"
    end

    it "print new dead cell" do 
        cell = Cell.new(0)
        expect(cell.state).to eq "."
    end

    it ".alive?" do
      cell = Cell.new(1)
      expect(cell.alive?).to be true
    end

    # it ".count_neighbors" do
      
    # end
end