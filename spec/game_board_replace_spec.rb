require 'daru'
require_relative '../lib/game_logic.rb'
require_relative '../lib/player_method.rb'
require_relative '../lib/game_board_replace.rb'

describe '.Game' do
  let(:tour) { Game.new }
  let(:player_name) { sign }
  context 'return X as sign' do
    let(:sign) { 0 }
    it ' return sign of the player' do
      expect(tour.sign(player_name)).to eq 'X'
    end
  end

  context 'return 0 as sign' do
    let(:sign) { 1 }
    it ' return sign of the player' do
      expect(tour.sign(player_name)).to eq 'O'
    end
  end

  context '#change Change the position to the sign' do
    let(:game_board) { Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: [3, 6, 9] }) }
    let(:move) { 3 }
    let(:player_name) { 1 }
    it 'returns diagonal array is true' do
      expect(tour.change(game_board, move, player_name)).to eq(Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: ['O', 6, 9] }))
    end
  end

  context '#start Return new game board if new game is called' do
    it 'returns new game board' do
      expect(tour.start).to eq(Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: [3, 6, 9] }))
    end
  end
end
