require 'rspec'
require 'matrix'
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

    it ".count_neighbors" do
        m = Matrix.build(3,3) { Cell.new(1) }.to_a
        expect(m[0][0].count_neighbors(m, 0, 0) ).to eq 3
        expect(m[0][1].count_neighbors(m, 0, 1) ).to eq 5
        expect(m[1][1].count_neighbors(m, 1, 1) ).to eq 8
    end

    it ".valid_range? return false" do
        m = Matrix.build(3,3) { Cell.new(1) }.to_a
        expect(m[0][0].valid_range?(-1,-1, m) ).to be false
        expect(m[0][0].valid_range?(4, 4, m) ).to be false
    end
    
    it ".valid_range? return true" do
        m = Matrix.build(3,3) { Cell.new(1) }.to_a
        expect(m[0][0].valid_range?(1, 1, m) ).to be true
    end

    it ".kill" do
        cell = Cell.new(1)
        expect{cell.kill}.to change {cell.state}.from("*").to(".")
    end

    it ".born" do
        cell = Cell.new(0)
        expect{cell.born}.to change {cell.state}.from(".").to("*")
    end

    it ".live_or_die => die" do
        cell = Cell.new(1)
        cell.neighbors = 5
        expect{cell.live_or_die}.to change {cell.state}.from("*").to(".")
        
        cell2 = Cell.new(1)
        cell2.neighbors = 1
        expect{cell2.live_or_die}.to change {cell2.state}.from("*").to(".")
    end

    
    it ".live_or_die => born" do
        cell = Cell.new(0)
        cell.neighbors = 3
        expect{cell.live_or_die}.to change {cell.state}.from(".").to("*")
    end
end