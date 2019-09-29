# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'


RSpec.describe Board do
  let!(:board) { Board.new }
  let!(:tie) { Board.new({
    1 => 'X', 2 => 'X', 3 => 'O',
    4 => 'O', 5 => 'X', 6 => 'X',
    7 => 'X', 8 => '0', 9 => 'O'
  })}
    context 'when a new board is created' do
      describe '#initialize' do
        it 'should create a new empty board' do
          board = Board.new 
          expect(board.grid[0]).to eq "@ " 
        end
        it "should create a board with a given grid" do
          tie = Board.new({
            1 => 'X', 2 => 'X', 3 => 'O',
            4 => 'O', 5 => 'X', 6 => 'X',
            7 => 'X', 8 => '0', 9 => 'O'
          })
          expect(tie.grid[1]).to eq "X"
        end
      end
    end
    context "display game board" do
      describe "#display" do
        it "should display a grid" do
          def display_test
      "
      |          |
      #{@grid[0]} | #{@grid[1]} | #{@grid[2]}
      -----------
      |          |
      #{@grid[3]} | #{@grid[4]} | #{@grid[5]}
      -----------
      |          |
      #{@grid[6]} | #{@grid[7]} | #{@grid[8]}
      "
          end
         
          tie =  Board.new({
            0 => 'X', 1 => 'X', 2 => 'O',
            3 => 'O', 4 => 'X', 5 => 'X',
            6 => 'X', 7 => '0', 8 => 'O'
          })
          
          @grid = tie.grid 
          expect(tie.display).to eq display_test
        end 
      end
    end
    context "check place selection" do
      describe "#valid_selection" do
        it "should return true when select a valid position" do
          board =  Board.new 
          expect(board.valid_selection?(8)).to eq true
        end
        it "should return false when select a valid position" do
          board =  Board.new 
          expect(board.valid_selection?(10)).to eq false
        end
      end
    end
end

