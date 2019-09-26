require_relative '../lib/player'

RSpec.describe Player do
  let!(:player) { Player.new('X', 'Dan') }
  
  it " Test our player name " do
    expect(player.name).to eql('Dan')
  end

  it " Test our player marker " do
    expect(player.marker).to eql('X')
  end

end