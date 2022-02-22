# frozen_string_literal: true
require 'matrix'
# Cell class
class Cell
  attr_reader :state
  attr_writer :neighbors
  def initialize(live_or_die)
    @state = live_or_die == 1 ? '*' : '.'
    @neighbors = 0
  end

  # def state
  #   @state
  # end

  def print_cell
    print @state
  end

  def alive?
    @state == '*'
  end

  def live_or_die
    born if (@neighbors == 3) && !alive?
    kill if (@neighbors < 2) || (@neighbors > 3)
    @neighbors = 0
  end

  def count_neighbors(matrix, row, col)
    (row - 1..row + 1).each do |coord_x|
      (col - 1..col + 1).each do |coord_y|
        next if (coord_x == row) && (coord_y == col)
        next unless valid_range?(coord_x, coord_y, matrix)
        @neighbors += matrix[coord_x][coord_y].alive? ? 1 : 0
      end
    end
    @neighbors
  end

  def valid_range?(row, col, matrix)
    return false if row.negative? || (row >= matrix.size) 
    return false if col.negative? || (col >= matrix[0].size) 
    true
  end

  def born
    @state = '*'
  end

  def kill
    @state = '.'
  end
end
