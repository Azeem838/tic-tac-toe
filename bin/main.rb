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

puts 'player 1: Enter your name'
name_player1 = gets.chomp
puts 'player 2: Enter your name'
name_player2 = gets.chomp
puts '********who is going first?*******'
puts "Enter 1 for #{name_player1}"
puts "Enter 2 for #{name_player2}"
puts 'Enter 3 for random'
count = 0
choice = 0
loop do
  choice = gets.chomp.to_i
  if choice == 1
    puts "#{name_player1} Please enter your move"
    count = 1
    break
  elsif choice == 2
    puts "#{name_player2} Please enter your move"
    count = 2
    break
  elsif choice == 3
    choice = [1, 2].sample
    puts " #{name_player1} Please enter your choice" if choice == 1
    puts " #{name_player2} Please enter your choice" if choice == 2
    count = choice
    break
  else puts 'Please choose either 1, 2 or 3'
  end
end

move = gets.chomp
p df
count = choice

4.times do
  if choice == 1
    puts "#{name_player2} Please enter your move"
    move = gets.chomp
    choice = 2
  else
    puts "#{name_player1} Please enter your move"
    move = gets.chomp
    choice = 1
  end
end

puts ''
