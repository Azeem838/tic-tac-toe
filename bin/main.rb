#!/usr/bin/env ruby
require 'daru'
puts 'Lets play tic-tac-toe'
puts '******Game Board******'

df = Daru::DataFrame.new(
  {
    'A' => %w[1 2 3],
    'B' => %w[4 5 6],
    'C' => %w[7 8 9]
  },
  index: %w[A B C]
)

p df
name_player = []
puts 'player 1: Enter your name'
name_player[0] = gets.chomp
puts 'player 2: Enter your name'
name_player[1] = gets.chomp
puts '********who is going first?*******'
puts "Enter 1 for #{name_player[0]}"
puts "Enter 2 for #{name_player[1]}"
choice = 0
loop do
  choice = gets.chomp.to_i
  if choice == 1
    puts " ********Okay!!#{name_player[0]} will Start*********"
    break
  elsif choice == 2
    puts "*********Okay!!#{name_player[1]} will start***********"
    break
  else puts 'Please choose either 1, 2'
  end
end
count = 0
game_on = true
t = choice - 1

while game_on

  puts "#{name_player[t]} Please enter your move"
  move = gets.chomp.to_i

  if move >= 1 && move <= 9
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
