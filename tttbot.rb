class TTTBot

  def initialize
    @players = {$player1, $player2}
  end

  def introduce(name, player)
    @players[name] = player
  end

  def run
    if @players.size != 2 
      raise "2 players required" 
    end
    state = [""] * 9
    for i in (1..9)
      newState = @players[i%2].makeMove(state.clone)
      if (winner?(newState))
        return @player[i%2]
      end
      state = newState
    end
    return "DRAW"
  end

end

def winner?(currentState)
  return allXorO(0, 1, 2, currentState) 
  || allXorO(3, 4, 5, currentState) 
  || allXorO(6, 7, 8, currentState) 
  || allXorO(0, 3, 6, currentState) 
  || allXorO(1, 4, 7, currentState) 
  || allXorO(2, 5, 8, currentState) 
  || allXorO(0, 4, 8, currentState) 
  || allXorO(2, 4, 6, currentState)
end

def allXorO(a, b, c, state) 
  return 'x' == state[a] && 'x' == state[b] && 'x' == state[c] ||
    'o' == state[a] && 'o' == state[b] && 'o' == state[c]
end

TTTBot.new.run


