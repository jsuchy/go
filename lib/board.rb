require 'location'

class Board
  attr_reader :size

  class InvalidMoveError < StandardError
  end

  def initialize(size=19)
    @board = {}
    @size = size
  end

  def rows
    (1..@size).to_a
  end

  def columns
    ("A".."Z").to_a.slice(0, @size)
  end

  def valid_row?(row)
    rows.include?(row)
  end

  def valid_column?(column)
    columns.include?(column)
  end

  def move(location_string, marker)
    location = Location.new(location_string)
    raise InvalidMoveError.new("invalid row") unless valid_row?(location.row)
    raise InvalidMoveError.new("invalid column") unless valid_column?(location.column)
    @board[location_string] = marker
  end

  def mark_at(location_string)
    @board[location_string]
  end
end
