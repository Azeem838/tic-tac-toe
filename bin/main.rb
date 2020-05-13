#!/usr/bin/env ruby
require 'daru'
require_relative 'game_logic.rb'

puts 'Lets play tic-tac-toe'
puts '******Game Board******'

df = Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: [3, 6, 9] })

p df
player = []
puts 'Player 1: Please Enter your name'
player[0] = Players.new(gets.chomp, 1)

puts 'Player 2: Please Enter your name'
player[1] = Players.new(gets.chomp, 2)

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
t = choice - 1

diag1 = []
diag2 = []

while game_on
  p df
  puts "#{name_player[t]} Please enter your move"
  move = gets.chomp.to_i

  if move >= 1 && move <= 9
    new_game.change(df, move, t)
    p df
    puts "#{name_player[t]} your move is displayed on the board"
    count += 1

    diag1 << df[0][0] if move == 1

    diag2 << df[2][0] if move == 3

    if move == 5
      diag1 << df[1][1]
      diag2 << df[1][1]
    end

    diag2 << df[0][2] if move == 7
    diag1 << df[2][2] if move == 9

    outcome = WinLose.new(df, t, move, diag1, diag2)
    p outcome.win(move, t, diag1, diag2)

    if outcome.win(move, t, diag1, diag2) == true
      game_on = false
      puts "*******Congratulations #{name_player[t]} You win"
    elsif outcome.draw(count) == true
      game_on = false
      puts 'draw game, there is no winner, try again'
    end
    t = (t + 3) % 2
  else
    puts "invalid move, #{name_player[t]} please choose again"
  end
end
