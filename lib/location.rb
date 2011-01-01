class Location
  attr_accessor :row, :column

  def initialize(location)
    @location = location
  end

  def column
    @location[0..0]
  end

  def row
    row_candidate = @location[1..-1].to_i

    raise StandardError.new("invalid row") if row_candidate.to_s != @location[1..-1]
    row_candidate
  end

end
