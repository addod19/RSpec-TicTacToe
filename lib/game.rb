# frozen_string_literal: true

# Game class
class Game
    attr_accessor :player1, :player2
    attr_reader :current_player, :board
  
    def initialize(board = nil)
      @board = board ? board : Board.new
      @player1 = Player.new('X')
      @player2 = Player.new('O')
      @current_player = [@player1, @player2].sample
    end
  
    def turn(selection)
      @board.place_marker(selection, @current_player.marker)
    end
  
    def switch_player
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
  
    def state
      return :win if @board.win?
      return :tie if @board.tie?
  
      :active
    end
end