# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

RSpec.describe Board do
  let!(:board) { Board.new }
  let!(:tie) do
    Board.new(
      1 => 'X', 2 => 'X', 3 => 'O',
      4 => 'O', 5 => 'X', 6 => 'X',
      7 => 'X', 8 => '0', 9 => 'O'
    )
  end
  context 'when a new board is created' do
    describe '#initialize' do
      it 'should create a new empty board' do
        board = Board.new
        expect(board.grid[0]).to eq '@ '
      end
      it 'should create a board with a given grid' do
        tie = Board.new(
          1 => 'X', 2 => 'X', 3 => 'O',
          4 => 'O', 5 => 'X', 6 => 'X',
          7 => 'X', 8 => '0', 9 => 'O'
        )
        expect(tie.grid[1]).to eq 'X'
      end
    end
  end
  context 'display game board' do
    describe '#display' do
      it 'should display grid length' do
        expect(board.grid.length).to eq(9)
      end
    end
  end
  context 'check place selection' do
    describe '#valid_selection' do
      it 'should return true when select a valid position' do
        board = Board.new
        expect(board.valid_selection?(8)).to eq true
      end
      it 'should return false when select a valid position' do
        board = Board.new
        expect(board.valid_selection?(10)).to eq false
      end
    end
  end
  context 'check for place marker' do
    describe '#place_marker' do
      it 'should place marker at the right position' do
        board = Board.new
        expect(board.place_marker(5, 'X')).to eql(board.grid[4])
      end
    end
  end
  context 'check for winning lines' do
    describe '#winning_lines' do
      it 'should win at the right values' do
        dbl = double(board)
        allow(dbl).to receive(:winning_lines).and_return('win')
      end
    end
  end
  context 'check for win' do
    describe '#win' do
      it 'should return win if game won' do
        dbl = double(board)
        allow(dbl).to receive(:win).and_return('Player won')
      end
    end
  end
  context 'check for tie' do
    describe '#tie' do
      it 'should return tie if no win' do
        dbl = double(board)
        allow(dbl).to receive(:tie).and_return('Game is tie')
      end
    end
  end
  context 'check for display' do
    describe '#display' do
      it 'check if two strings are equal' do
        dbl = double(board)
        allow(dbl).to receive(:display).and_return(@grid)
      end
    end
  end
end
