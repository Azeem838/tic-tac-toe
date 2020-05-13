class Players
  attr_reader :name
  attr_reader :player_num
  def initialize(name, player_num)
    @name = name
    @player_num = player_num
  end
end

class Game
  attr_accessor :game_board

  def sign(player_num)
    @sign = player_num
    @sign == 1 ? 'O' : 'X'
  end

  def change(game_board, move, player_num)
    @game_board = game_board
    @player_num = player_num
    case move
    when 1 then game_board.replace_values game_board[0][0], sign(player_num)
    when 2 then game_board.replace_values game_board[1][0], sign(player_num)
    when 3 then game_board.replace_values game_board[2][0], sign(player_num)
    when 4 then game_board.replace_values game_board[0][1], sign(player_num)
    when 5 then game_board.replace_values game_board[1][1], sign(player_num)
    when 6 then game_board.replace_values game_board[2][1], sign(player_num)
    when 7 then game_board.replace_values game_board[0][2], sign(player_num)
    when 8 then game_board.replace_values game_board[1][2], sign(player_num)
    when 9 then game_board.replace_values game_board[2][2], sign(player_num)
    end
  end

  def start
    true
  end
end

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
