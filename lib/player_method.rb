class Players
  attr_reader :name
  attr_reader :player_num
  def initialize(name, player_num)
    @name = name
    @player_num = player_num
  end
end
