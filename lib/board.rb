require 'location'

class Board
  attr_reader :size

  class InvalidMoveError < StandardError
  end

  def initialize(size=19)
    @board = {}
    @size = size
  end

  def last_valid_column
    ("A".."Z").to_a[@size - 1]
  end

  def move(location_string, marker)
    location = Location.new(location_string)
    raise InvalidMoveError.new("invalid row") if location.row > @size
    raise InvalidMoveError.new("invalid column") unless ["A"..last_valid_column] === location.column || location.column == "A" || location.column == last_valid_column
    @board[location_string] = marker
  end

  def mark_at(location_string)
    @board[location_string]
  end
end
