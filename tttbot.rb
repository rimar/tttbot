class TTTBot

  def initialize
    @players = [$player1, $player2]
  end

  def run
    puts @players
    puts @players.size
    if @players.size != 2 
      raise "2 players required" 
    end
    state = ["."] * 9
    for i in (0..8)
      newState = @players[i%2].makeMove(state.clone)
      puts("move[#{i}]: #{newState}")
      if (!legalMove?(newState, state))
        return @player[(i+1)%2]
      end
      if (winner?(newState))
        return @players[i%2]
      end
      state = newState
    end
    return "DRAW"
  end

end

def legalMove?(newState, state)
  differCount = (0..8).count{|x| state[x] != newState[x]}
  legal = (differCount == 1)
  puts("illegal state, count [#{differCount}] ") if !legal
  return legal
end

def winner?(currentState)
  line(0, 1, 2, currentState) || 
    line(3, 4, 5, currentState) || 
    line(6, 7, 8, currentState) || 
    line(0, 3, 6, currentState) || 
    line(1, 4, 7, currentState) || 
    line(2, 5, 8, currentState) || 
    line(0, 4, 8, currentState) || 
    line(2, 4, 6, currentState)
end

def line(a, b, c, state) 
  'x' == state[a] && 'x' == state[b] && 'x' == state[c] ||
    'o' == state[a] && 'o' == state[b] && 'o' == state[c]
end

require 'config'
puts "The winner is: #{TTTBot.new.run}"

