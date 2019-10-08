#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

# Main game loop
# rubocop:disable Metrics/BlockLength
loop do
  system 'clear'
  game = Game.new
  puts 'Welcome to Tic-Tac-Toe!'

  player_names = []
  2.times do |i|
    print "Please enter name of player #{i + 1}: "
    player_names << gets.chomp
  end

  game.player1.name = player_names[0]
  game.player2.name = player_names[1]

  # Player turn loop
  loop do
    game.switch_player
    system 'clear'
    puts game.board.display

    selection = ''
    loop do
      puts "#{game.current_player.name}(#{game.current_player.marker}), it's your turn."
      print 'Enter your selection (1-9): '
      selection = gets.chomp.to_i
      break if game.board.valid_selection?(selection) && (1..9).include?(selection)

      puts 'Sorry, that selection is invalid!'
    end

    game.turn(selection)
    break unless game.state == :active
  end
  system 'clear'
  puts game.board.display

  puts game.state == :win ? "#{game.current_player.name} wins!" : "It's a draw!"

  print 'Would you like to play again? (y/n): '
  break unless gets.chomp.downcase.start_with?('y')
end
