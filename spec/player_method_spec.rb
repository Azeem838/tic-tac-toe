require_relative '../lib/game_logic.rb'
require_relative '../lib/player_method.rb'
require_relative '../lib/game_board_replace.rb'

describe '.Players' do
  let(:player) { Players.new('Player_1', 0) }
  it 'returns player name when called' do
    expect(player.name).to eq('Player_1')
  end

  it 'returns player number when called' do
    expect(player.player_num).to eq(0)
  end
end
