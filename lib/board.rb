require 'location'

class Board
  attr_reader :size

  class InvalidMoveError < StandardError
  end

  def initialize(size=19)
    @board = {}
    @size = size
  end

  def move(location_string, marker)
    location = Location.new(location_string)
    raise InvalidMoveError.new("invalid row") unless location.valid_row?(@size)
    raise InvalidMoveError.new("invalid column") unless location.valid_column?(@size)
    @board[location_string] = marker
  end

  def mark_at(location_string)
    @board[location_string]
  end
end
