require 'spec_helper'
require 'location'
require 'board'

describe Location do

  it "parses the column" do
    location = Location.new("B52")

    location.column.should == "B"
  end

  it "parses the row" do
    location = Location.new("B52")

    location.row.should == 52
  end

  it "raises an exception if row is not a number" do
    location = Location.new("DZ")

    lambda { location.row }.should raise_error
  end

end
