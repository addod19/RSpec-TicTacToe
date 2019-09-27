# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

RSpec.describe Game do
  board_empty = Board.new(
    1 => ' ', 2 => ' ', 3 => ' ',
    4 => ' ', 5 => ' ', 6 => ' ',
    7 => ' ', 8 => ' ', 9 => ' '
  )

  win = Board.new(
    1 => '', 2 => '', 3 => 'X',
    4 => '', 5 => '', 6 => 'X',
    7 => '', 8 => '', 9 => 'X'
  )

  tie = Board.new(
    1 => 'X', 2 => 'X', 3 => 'O',
    4 => 'O', 5 => 'X', 6 => 'X',
    7 => 'X', 8 => '0', 9 => 'O'
  )

  let!(:game) { Game.new }
  let!(:win_game) { Game.new(win) }
  let!(:tie_game) { Game.new(tie) }

  context 'when a new game is created' do
    describe '#initialize' do
      it 'should create a new empty grid' do
        expect(game.board).to be_a Board
      end
    end

    describe '#state' do
      it 'should return :active' do
        expect(game.state).to eql(:active)
      end
    end
  end

  context 'when game is active and player takes turn' do
    describe '#switch_player' do
      it 'should switch the current player' do
        test_player = game.current_player
        game.switch_player
        expect(game.current_player).not_to eql(test_player)
      end
    end

    describe '#turn' do
      it 'should place a marker at the selected position' do
        game.turn(8)
        expect(game.board.grid[8]).to(satisfy) { |x| %w[X O].include?(x) }
      end
    end

    describe '#state' do
      it 'should return :active' do
        expect(game.state).to eql(:active)
      end
    end
  end

  context 'when the game is in a win state' do
    describe '#state' do
      it 'should return :win' do
        expect(win_game.state).to eql(:win)
      end
    end
  end

  context 'when the game is in a tie state' do
    describe '#state' do
      it 'should return :tie' do
        expect(tie_game.state).to eq(:tie)
      end
    end
  end
  
end
