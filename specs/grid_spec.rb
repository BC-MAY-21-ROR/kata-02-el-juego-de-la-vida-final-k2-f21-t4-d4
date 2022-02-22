require 'rspec'
require_relative '../game/grid'

describe Grid do
    it ".print_grid" do 
        grid = Grid.new(3, 3)
        grid.matrix.each {|row| row.each { |cell| cell.born } }
        expect{grid.print_grid}.to output("***\n***\n***\n").to_stdout
    end
end