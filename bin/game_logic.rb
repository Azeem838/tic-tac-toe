class Players
  attr_reader :name
  attr_reader :player_num
  def initialize(name, player_num)
    @name = name
    @player_num = player_num
  end
end

class Game
  attr_accessor :df
  @@sign
  def sign(t)
    @@sign = t
    @@sign == 1 ? 'O' : 'X'
 end

  def change(df, move, t)
    @df = df
    @t = t
    case move
    when 1 then df.replace_values df[0][0], sign(t)
    when 2 then df.replace_values df[1][0], sign(t)
    when 3 then df.replace_values df[2][0], sign(t)
    when 4 then df.replace_values df[0][1], sign(t)
    when 5 then df.replace_values df[1][1], sign(t)
    when 6 then df.replace_values df[2][1], sign(t)
    when 7 then df.replace_values df[0][2], sign(t)
    when 8 then df.replace_values df[1][2], sign(t)
    when 9 then df.replace_values df[2][2], sign(t)
    end
  end

  def start
    true
  end
end

class WinLose < Game
  attr_reader :df
  @@outcome = false
  @@diag1 = []
  @@diag2 = []
  def initialize(df, t, move, check)
    @check = check
    @df = df
    @t = t
    @move = move
  end

  def win
    @@diag1 = (0..2).collect { |i| df[i][i] }
    @@diag2 = (0..2).collect { |i| df[i][-i - 1] }

    if (@move == 1 || @move == 9 || @move == 5) && (@@diag1.all? { |x| x == sign(@t) } == true)
      return true
    elsif (@move == 3 || @move == 7 || @move == 5) && (@@diag2.all? { |x| x == sign(@t) } == true)
      return true
    end

    if @move == 1 && ((df.row[0].all? { |row| row[0] == sign(@t) } || df[0].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 2 && ((df.row[0].all? { |row| row[0] == sign(@t) } || df[1].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 3 && ((df.row[0].all? { |row| row[0] == sign(@t) } || df[2].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 4 && ((df.row[1].all? { |row| row[0] == sign(@t) } || df[0].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 5 && ((df.row[1].all? { |row| row[0] == sign(@t) } || df[1].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 6 && ((df.row[1].all? { |row| row[0] == sign(@t) } || df[2].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 7 && ((df.row[2].all? { |row| row[0] == sign(@t) } || df[0].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 8 && ((df.row[2].all? { |row| row[0] == sign(@t) } || df[1].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 9 && ((df.row[2].all? { |row| row[0] == sign(@t) } || df[2].all? { |col| col[0] == sign(@t) }) == true)
      true
    elsif @move == 1
    end
  end

  def check
    if @check[@move] == 0
      @check[@move] = 1
      true
    else false
   end
 end

  def draw(count)
    count == 9
  end
end
