#!/usr/bin/env ruby
require 'daru'
require_relative 'game_logic.rb'

puts 'Lets play tic-tac-toe'
puts '******Game Board******'

df = Daru::DataFrame.new([[1, 4, 7], [2, 5, 8], [3, 6, 9]], order: %i[A B C], index: %i[A B C])

p df
player =[]
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
new_game=Game.new
game_on=new_game.start

count = 0
t = choice - 1

while game_on
  p df
  puts "#{name_player[t]} Please enter your move"
  move = gets.chomp.to_i

  if move >= 1 && move <= 9
   new_game.change(df,move,t)
    p df
    puts "#{name_player[t]} your move is displayed on the board"
    count += 1
    if move == 8
      game_on = false
      puts "*******Congratulations #{name_player[t]} You win"
    end
    t = (t + 3) % 2
  else
    puts "invalid move, #{name_player[t]} please choose again"
  end

  next unless count == 6

  p df
  game_on = false
  puts 'draw game, there is no winner, try again'
  break
end
