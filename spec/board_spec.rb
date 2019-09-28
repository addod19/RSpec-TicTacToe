require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

RSpec.describe Board do
    it 'has a 3 x 3 grid' do
      board = Board.new
      expect(board.board[0]).to eq 3
      expect(board.Board).to eq 3
    end
end


