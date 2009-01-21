class TTTBot

  def initialize
    @players = {}
  end

  def introduce(name, player)
    @players[name] = player
  end

  def run
    if @players.size != 2 
      raise "2 players required" 
    end

    return @players.keys[0]
  end

end

def init
  return TTTBot.new
end

