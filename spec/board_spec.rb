require 'spec_helper'
require 'board'

describe Board do

  let(:board) { Board.new }
  
  it "defaults the size to 19" do
    board.size.should == 19
  end

  it "allows overriding the size on initialize" do
    board = Board.new(9)

    board.size.should == 9
  end

  it "exposes possible rows" do
    board = Board.new(4)

    board.rows.should == [1, 2, 3, 4]
  end

  it "exposes possible columns" do
    board = Board.new(4)

    board.columns.should == ["A", "B", "C", "D"]
  end
  
  it "row is not valid if greater than size" do
    board.valid_row?(20).should be_false
  end

  it "row is valid if equal to size" do
    board.valid_row?(19).should be_true
  end

  it "column is not valid if greater than size" do
    board.valid_column?("T").should be_false
  end

  it "column is valid if inside range of A to size'th letter" do
    board.valid_column?("C").should be_true
  end

  it "column is valid if it is A" do
    board.valid_column?("A").should be_true
  end

  it "column is valid if it is the right endpoint" do
    board.valid_column?("S").should be_true
  end

  it "tracks moves" do
    board.move("A1", :black)
    board.move("A2", :white)

    board.mark_at("A1").should == :black
    board.mark_at("A2").should == :white
  end

  it "allows moves in the corners" do
    board.move("A1", :black)
    board.move("A19", :black)
    board.move("S1", :black)
    board.move("S19", :black)
  end

  it "raises an exception for an invalid move row" do
    lambda {board.move("A20", :black)}.should raise_error(Board::InvalidMoveError)
  end

  it "raises an exception for an invalid column" do
    lambda {board.move("T1", :black)}.should raise_error(Board::InvalidMoveError)
  end

end
