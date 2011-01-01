class Location
  attr_accessor :row, :column

  def initialize(location)
    @location = location
  end

  def column
    @location[0..0]
  end

  def row
    @location[1..-1].to_i
  end

  def valid_row?(board)
    board.rows.include?(row)
  end

  def valid_column?(board)
    board.columns.include?(column)
  end
end
