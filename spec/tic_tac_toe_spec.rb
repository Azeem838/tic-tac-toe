require 'daru'
require_relative '../lib/game_logic.rb'
require_relative '../lib/game_board_replace.rb'

describe '.WinLose' do
game_board = Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: [3, 6, 9] })
let(:try) { WinLose.new(game_board, 1, move, check) }
  context "check is the move is already occupied" do
  	let(:game_board ) { Daru::DataFrame.new({ a: ['O', 'O', 7], b: [2, 5, 8], c: [3, 6, 9] }) }
  	let(:move) { 7 }
  	let(:check) { [0, 1, 0, 0, 1, 0, 0, 0, 0, 0] }
  	 it"enters the move and return true" do
  	 expect(try.check).to eq(true)
  	end

  	end

  	context "check is the move is already occupied" do
  	let(:game_board) {Daru::DataFrame.new({ a: ['O', 'O', 7], b: [2, 5, 8], c: [3, 6, 9] }) }
  	let(:move) { 1 }
  	let(:check) { [0, 1, 0, 0, 1, 0, 0, 0, 0, 0] }
  	diag1 = -> { (0..2).collect { |i| game_board[i][i] } }
  	puts "razak"
  	 it"enters the move and return true" do
  	 expect(try.check).to eq(false)
  	end

  	end

  	context "check is the move is already occupied" do
  	let(:game_board) { Daru::DataFrame.new({ a: ['O', 4, 'O'], b: [2, 5, 8], c: [3, 6, 9] }) }
  	let(:move) { 1 }
  	let(:check) { [0, 1, 0, 0, 0, 0, 0, 1, 0, 0] }
  	 it"checks winning postion for vertical" do
  	 expect(try.win).to eq(nil)
  	end

  	end
end
