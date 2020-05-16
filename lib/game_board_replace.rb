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
