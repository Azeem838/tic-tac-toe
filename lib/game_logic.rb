require_relative 'player_method.rb'
require_relative 'game_board_replace.rb'

class WinLose < Game
  attr_reader :game_board
  def initialize(game_board, player_num, move, check)
    @check = check
    @game_board = game_board
    @player_num = player_num
    @move = move
    @outcome = false
    @diag1 = -> {}
    @diag2 = -> {}
    @row_zero = -> {}
    @row_one = -> {}
    @row_two = -> {}
    @col_zero = -> {}
    @col_one = -> {}
    @col_two = -> {}
    @diag1 = -> { (0..2).collect { |i| game_board[i][i] } }
    @diag2 = -> { (0..2).collect { |i| game_board[i][-i - 1] } }
    @row_zero = -> { @game_board.row[0].all? { |row| row[0] == sign(@player_num) } }
    @row_one = -> { @game_board.row[1].all? { |row| row[0] == sign(@player_num) } }
    @row_two = -> { @game_board.row[2].all? { |row| row[0] == sign(@player_num) } }
    @col_zero = -> { @game_board[0].all? { |col| col[0] == sign(@player_num) } }
    @col_one = -> { @game_board[1].all? { |col| col[0] == sign(@player_num) } }
    @col_two = -> { @game_board[2].all? { |col| col[0] == sign(@player_num) } }
  end

  def board_checks
    @row_zero = -> { @game_board.row[0].all? { |row| row[0] == sign(@player_num) } }
    @row_one = -> { @game_board.row[1].all? { |row| row[0] == sign(@player_num) } }
    @row_two = -> { @game_board.row[2].all? { |row| row[0] == sign(@player_num) } }
    @col_zero = -> { @game_board[0].all? { |col| col[0] == sign(@player_num) } }
    @col_one = -> { @game_board[1].all? { |col| col[0] == sign(@player_num) } }
    @col_two = -> { @game_board[2].all? { |col| col[0] == sign(@player_num) } }
  end

  def diagonals
    @diag1 = -> { (0..2).collect { |i| game_board[i][i] } }
    @diag2 = -> { (0..2).collect { |i| game_board[i][-i - 1] } }
  end

  def win
    return true if (@move == 1 || @move == 9 || @move == 5) && (@diag1.call.all? { |x| x == sign(@player_num) } == true)
    return true if (@move == 3 || @move == 7 || @move == 5) && (@diag2.call.all? { |x| x == sign(@player_num) } == true)

    return true if @move == 1 && ((@row_zero.call || @col_zero.call) == true)
    return true if @move == 2 && ((@row_zero.call || @col_one.call) == true)
    return true if @move == 3 && ((@row_zero.call || @col_two.call) == true)
    return true if @move == 4 && ((@row_one.call || @col_zero.call) == true)
    return true if @move == 5 && ((@row_one.call || @col_one.call) == true)
    return true if @move == 6 && ((@row_one.call || @col_two.call) == true)
    return true if @move == 7 && ((@row_two.call || @col_zero.call) == true)
    return true if @move == 8 && ((@row_two.call || @col_one.call) == true)
    return true if @move == 9 && ((@row_two.call || @col_two.call) == true)
  end

  def check
    if @check[@move].zero?
      @check[@move] = 1
      true
    else false
    end
  end

  def draw(count)
    count == 9
  end
end
