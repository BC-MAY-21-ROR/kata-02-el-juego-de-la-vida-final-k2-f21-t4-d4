# frozen_string_literal: true

require_relative 'grid'

game = Grid.new(4, 8)
game.print_grid
game.analyze_cells
puts
game.print_grid
game.analyze_cells
puts
game.print_grid
