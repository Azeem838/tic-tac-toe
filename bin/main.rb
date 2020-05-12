#!/usr/bin/env ruby
require 'daru'
require_relative 'game_logic.rb'

puts 'Lets play tic-tac-toe'
puts '******Game Board******'

df = Daru::DataFrame.new([[1, 4, 7], [2, 5, 8], [3, 6, 9]], order: %i[A B C], index: %i[A B C])

p df

puts 'Player 1: Please Enter your name'
player1 = Players.new(gets.chomp, 1)

puts 'Player 2: Please Enter your name'
player2 = Players.new(gets.chomp, 2)

name_player = [player1, player2]

puts '********who is going first?*******'
puts "Enter 1 for #{name_player[0].name}"
puts "Enter 2 for #{name_player[1].name}"
choice = 0
loop do
  choice = gets.chomp.to_i
  if choice == 1
    puts " ********Okay!!#{name_player[0].name} will Start*********"
    break
  elsif choice == 2
    puts "*********Okay!!#{name_player[1].name} will start***********"
    break
  else puts 'Please choose either 1, 2'
  end
end

count = 0
game_on = true
t = choice - 1

while game_on

  puts "#{name_player[t].name} Please enter your move"
  move = gets.chomp.to_i

  if move >= 1 && move <= 9
    case move
    when 1 then df.replace_values df[0][0], name_player[t].sign
    when 2 then df.replace_values df[1][0], name_player[t].sign
    when 3 then df.replace_values df[2][0], name_player[t].sign
    when 4 then df.replace_values df[0][1], name_player[t].sign
    when 5 then df.replace_values df[1][1], name_player[t].sign
    when 6 then df.replace_values df[2][1], name_player[t].sign
    when 7 then df.replace_values df[0][2], name_player[t].sign
    when 8 then df.replace_values df[1][2], name_player[t].sign
    when 9 then df.replace_values df[2][2], name_player[t].sign
    end
    p df
    puts "#{name_player[t].name} your move is displayed on the board"
    count += 1
    if move == 8
      game_on = false
      puts "*******Congratulations #{name_player[t].name} You win"
    end
    t = (t + 3) % 2
  else
    puts "invalid move, #{name_player[t].name} please choose again"
  end

  next unless count == 6

  p df
  game_on = false
  puts 'draw game, there is no winner, try again'
  break
end
