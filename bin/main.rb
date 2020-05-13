#!/usr/bin/env ruby
require 'daru'
require_relative 'game_logic.rb'

puts 'Lets play tic-tac-toe'
puts '******Game Board******'

df = Daru::DataFrame.new({ a: [1, 4, 7], b: [2, 5, 8], c: [3, 6, 9] })
check = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

p df
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
t = choice - 1

while game_on
  p df
  puts "#{name_player[t]} Please enter your move"
  move = gets.chomp.to_i
  outcome = WinLose.new(df, t, move, check)
  if move >= 1 && move <= 9 && outcome.check
    new_game.change(df, move, t)
    puts "#{name_player[t]} your move is displayed on the board"
    count += 1

    if outcome.win == true
      game_on = false
      puts "*******Congratulations #{name_player[t]} You win"
      p df
    elsif outcome.draw(count) == true
      game_on = false
      puts 'draw game, there is no winner, try again'
      p df
    end
    t = (t + 3) % 2

  else
    puts "invalid move, #{name_player[t]} please choose again"
  end
end
