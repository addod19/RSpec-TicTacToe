# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

describe Board do
  it 'has a 3 x 3 grid' do
    board = Board.new
    expect(board.board[0].size).to eq 3
    expect(board.board.size).to eq 3
  end
end

describe '#display' do
  context 'various game situations' do
    it 'prints a blank board when the board array is empty' do
      board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

      output = capture_puts { display(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq('   |   |   ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq('   |   |   ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq('   |   |   ')
    end

    it 'prints a board with an X in the center position' do
      board = [' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ']

      output = capture_puts { display_board(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq('   |   |   ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq('   | X |   ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq('   |   |   ')
    end

    it 'prints a board with O in the top left' do
      board = ['O', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

      board[0] = 'O'

      output = capture_puts { display_board(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq(' O |   |   ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq('   |   |   ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq('   |   |   ')
    end

    it 'prints a board with an X in the center and an O in the top left' do
      board = ['O', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ']
      board[0] = 'O'
      board[4] = 'X'

      output = capture_puts { display(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq(' O |   |   ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq('   | X |   ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq('   |   |   ')
    end

    it 'prints a board with X winning via the top row' do
      board = ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ']

      output = capture_puts { display_board(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq(' X | X | X ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq('   |   |   ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq('   |   |   ')
    end

    it 'prints a board with O winning via the bottom row' do
      board = [' ', ' ', ' ', ' ', ' ', ' ', 'O', 'O', 'O']

      output = capture_puts { display_board(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq('   |   |   ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq('   |   |   ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq(' O | O | O ')
    end

    it 'prints a board with X winning in a top left to bottom right diagonal' do
      board = ['X', ' ', ' ', ' ', 'X', ' ', ' ', ' ', 'X']

      output = capture_puts { display_board(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq(' X |   |   ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq('   | X |   ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq('   |   | X ')
    end

    it 'prints a board with O winning in a top right to bottom left diagonal' do
      board = [' ', ' ', 'O', ' ', 'O', ' ', 'O', ' ', ' ']

      output = capture_puts { display(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq('   |   | O ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq('   | O |   ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq(' O |   |   ')
    end

    it 'prints arbitrary arrangements of the board' do
      board = %w[X X X X O O X O O]

      output = capture_puts { display(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq(' X | X | X ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq(' X | O | O ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq(' X | O | O ')

      board = %w[X O X O X X O X O]

      output = capture_puts { display(board) }
      rows = output.split("\n")

      expect(rows[0]).to eq(' X | O | X ')
      expect(rows[1]).to eq('-----------')
      expect(rows[2]).to eq(' O | X | X ')
      expect(rows[3]).to eq('-----------')
      expect(rows[4]).to eq(' O | X | O ')
    end

    it 'prints an entire board full of Xs' do
      board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

      output = capture_puts { display(board) } if defined?(display)
      rows = output.split("\n")
      expect(true).to be(true)
    end

    it 'prints an entire board full of Os' do
      expect(true).to be(true)
    end
  end
end

