class Players
  attr_reader :name
  def initialize(name, player_num)
    @name = name
    @player_num = player_num
  end

  def sign
    @player_num == 1 ? 'X' : 'O'
  end
end
