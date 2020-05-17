require 'daru'
require_relative '../lib/game_logic.rb'
require_relative '../lib/player_method.rb'
require_relative '../lib/game_board_replace.rb'

describe '#WinLose' do  
  let(:try) { WinLose.new(game_board, 1, move, check) }
  before(:each) do 
    try.diagonals
    try.board_checks
  end
  context '#check is the move is already occupied' do
    let(:game_board) { Daru::DataFrame.new({ a: ['O', 'O', 7], b: [2, 5, 8], c: [3, 6, 9] }) }
    let(:move) { 7 }
    let(:check) { [0, 1, 0, 0, 1, 0, 0, 0, 0, 0] }
    it 'enters the move and return true' do
      expect(try.check).to eq(true)
    end
  end

  context '#check is the move is already occupied' do
    let(:game_board) { Daru::DataFrame.new({ a: ['O', 'O', 7], b: [2, 5, 8], c: [3, 6, 9] }) }
    let(:move) { 1 }
    let(:check) { [0, 1, 0, 0, 1, 0, 0, 0, 0, 0] }
    diag1 = -> { (0..2).collect { |i| game_board[i][i] } }
    it 'enters the move and return true' do
      expect(try.check).to eq(false)
    end
  end

  context '#win is working in diagonal position' do
    let(:game_board) { Daru::DataFrame.new({ a: ['O', 4, 7], b: [2, 'O', 8], c: [3, 6, 'O'] }) }
    let(:move) { 5 }
    let(:check) { [0, 1, 0, 0, 0, 0, 0, 0, 0, 1] }
    it 'checks winning postion for vertical' do
      expect(try.win).to eq(true)
    end
  end

  context '#win is working in horizontal position' do
    let(:game_board) { Daru::DataFrame.new({ a: ['O', 4, 7], b: ['O', 5, 8], c: ['O', 6, 9] }) }
    let(:move) { 2 }
    let(:check) { [0, 1, 0, 0, 0, 0, 0, 0, 0, 1] }
    it 'checks winning postion for vertical' do
      expect(try.win).to eq(true)
    end
  end

  context '#win is working in vertical position' do
    let(:game_board) { Daru::DataFrame.new({ a: ['O', 'O', 'O'], b: [2, 5, 8], c: [3, 6, 9] }) }
    let(:move) { 1 }
    let(:check) { [0, 1, 0, 0, 0, 0, 0, 0, 0, 1] }
    it 'checks winning postion for vertical' do
      expect(try.win).to eq(true)
    end
  end

  context '#diagonals is checking the diagonal array' do
    let(:game_board) { Daru::DataFrame.new({ a: ['O', 4, 7], b: [2, 5, 8], c: [3, 6, 'O'] }) }
    let(:move) { 5 }
    let(:check) { [0, 1, 0, 0, 0, 0, 0, 0, 0, 1] }
    it 'returns diagonal array' do
      expect(try.diagonals.call).to eq([7, 5, 3])
    end
  end

  context '#board_checks is checking the diagonal array' do
    let(:game_board) { Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: ['O', 'O', 'O'] }) }
    let(:move) { 3 }
    let(:check) { [0, 0, 0, 0, 0, 0, 0, 0, 1, 1] }
    it 'returns diagonal array is true' do
      expect(try.board_checks.call).to be true
    end
  end
end
