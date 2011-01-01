require 'spec_helper'
require 'location'

describe Location do

  it "parses the column" do
    location = Location.new("B52")

    location.column.should == "B"
  end

  it "parses the row" do
    location = Location.new("B52")

    location.row.should == 52
  end

  it "row is not valid if greater than size" do
    location = Location.new("A9")

    location.valid_row?(8).should be_false
  end

  it "row is valid if equal to size" do
    location = Location.new("A8")

    location.valid_row?(8).should be_true
  end

  it "column is not valid if greater than size" do
    location = Location.new("I8")

    location.valid_column?(8).should be_false
  end

  it "column is valid if inside range of A to size'th letter" do
    location = Location.new("C8")

    location.valid_column?(8).should be_true
  end
end
