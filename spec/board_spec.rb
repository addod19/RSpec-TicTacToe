require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

RSpec.describe Board do

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
          }
          )
          expect(tie.grid[1]).to eq "X"
        end
      end
    end
end


