#!/usr/bin/env ruby
require 'daru'
require_relative '../lib/game_logic.rb'

puts 'Lets play tic-tac-toe'
puts '******Game Board******'

game_board = Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: [3, 6, 9] })
check = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

p game_board
player = []
player1_name = ''
player2_name = ''

until player1_name.length >= 3
  puts 'Player 1: Please Enter your name (3 characters or more)'
  player1_name = gets.chomp
end

until player2_name.length >= 3
  puts 'Player 2: Please Enter your name (3 characters or more)'
  player2_name = gets.chomp
end

player[0] = Players.new(player1_name, 1)
player[1] = Players.new(player2_name, 2)

name_player = [player[0].name, player[1].name]

puts '********who is going first?*******'
puts "Enter 1 for #{player[0].name}"
puts "Enter 2 for #{player[1].name}"
choice = 0
loop do
  choice = gets.chomp.to_i
  if choice == 1
    puts " ********Okay!!#{player[0].name} will Start*********"
    break
  elsif choice == 2
    puts "*********Okay!!#{player[1].name} will start***********"
    break
  else puts 'Please choose either 1, 2'
  end
end
new_game = Game.new
game_on = new_game.start

count = 0
player_num = choice - 1
play = true

while play

  while game_on
    p game_board
    puts "#{name_player[player_num]} Please enter a number between 1 and 9"
    move = gets.chomp.to_i
    outcome = WinLose.new(game_board, player_num, move, check)
    if move >= 1 && move <= 9 && outcome.check
      new_game.change(game_board, move, player_num)
      puts "#{name_player[player_num]} your move is displayed on the board with #{new_game.sign(player_num)}"
      count += 1

      outcome.board_checks
      outcome.diagonals

      if outcome.win == true
        game_on = false
        puts "*******Congratulations #{name_player[player_num]} You win"
        p game_board
      elsif outcome.draw(count) == true
        game_on = false
        puts 'draw game, there is no winner, try again'
        p game_board
      end
      player_num = (player_num + 3) % 2

    else
      puts "invalid move, #{name_player[player_num]} please choose again"
    end
  end

  puts 'Enter 1 If you want to start a new game?'
  puts 'Enter 0 to Quit'
  countinue = gets.chomp.to_i
  if countinue == 1
    game_on = new_game.start
    game_board = Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: [3, 6, 9] })
    check = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  elsif countinue.zero?
    play = false

  else puts 'enter either 0 or 1'
  end
end
