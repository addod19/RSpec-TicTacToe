# frozen_string_literal: true

class Player
  attr_reader :name, :marker
  attr_writer :name

  def initialize(marker, name = 'Player')
    @marker = marker
    @name = name
  end
end
