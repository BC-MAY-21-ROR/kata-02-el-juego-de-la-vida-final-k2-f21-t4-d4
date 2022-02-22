# frozen_string_literal: true

require 'matrix'
require_relative 'cell'

# Grid class
class Grid
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @matrix = Matrix.build(@rows, @cols) { Cell.new(rand(4)) }.to_a
  end

  def print_grid
    @matrix.each do |row|
      row.each(&:print_cell)
      puts
    end
  end

  def analyze_cells
    @matrix.each.with_index do |row, coord_x|
      row.each.with_index do |cell, coord_y|
        cell.count_neighbors(@matrix, coord_x, coord_y)
      end
    end

    live_or_die_for_all
  end

  def live_or_die_for_all
    @matrix.each do |row|
      row.each(&:live_or_die)
    end
  end
end
