class Location
  attr_accessor :row, :column

  def initialize(location_as_string)
    @location = location_as_string
  end

  def column
    @location[0..0]
  end

  def row
    @location[1..-1].to_i
  end

  def valid_row?(size)
    row <= size
  end

  def valid_column?(size)
    last_valid_column = ("A".."Z").to_a[size - 1]
    puts "last_valid_column #{last_valid_column}"
    ["A"..last_valid_column] === column
  end
end
