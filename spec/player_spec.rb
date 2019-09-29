# frozen_string_literal: true

require_relative '../lib/player'

RSpec.describe Player do
  let!(:player) { Player.new('X', 'Dan') }

  it ' Test our player name ' do
    expect(player.name).to eql('Dan')
  end
  it ' Not Test our player name ' do
    expect(player.name).not_to eql('Maya')
  end

  it ' Test our player marker ' do
    expect(player.marker).to eql('X')
  end
  it ' Not Test our player marker ' do
    expect(player.marker).not_to eql('O')
  end
end
