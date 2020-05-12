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
   def sign (t)
   	@@sign=t
    @@sign == 1 ? 'X' : 'O'
  end
 def change(df,move,t)
 	@df=df
 	@t=t 
 	case move
    when 1 then df.replace_values df[0][0],   sign(t)
    when 2 then df.replace_values df[1][0],   sign(t)
    when 3 then df.replace_values df[2][0],   sign(t)
    when 4 then df.replace_values df[0][1],   sign(t)
    when 5 then df.replace_values df[1][1],   sign(t)
    when 6 then df.replace_values df[2][1],   sign(t)
    when 7 then df.replace_values df[0][2],   sign(t)
    when 8 then df.replace_values df[1][2],   sign(t)
    when 9 then df.replace_values df[2][2],   sign(t)
    end
 end
 def start
 return true
 end



end