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
