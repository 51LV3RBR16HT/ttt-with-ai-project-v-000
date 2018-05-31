module Players
  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.detect{|move|board.valid_move?(move)}
    end
  end

end
# This is where the AI goes.

# build out this class

# You should strive to build computer logic that when the computer plays, the game is unwinnable. You can hardcode your logic, things like "On turn 1 always try to go in the middle if you can" and if not "try to go in a corner" or any logic tree you can think of - there is an algorithm called Min/Max, but it's going to be hard to implement given our current implementation of a Game, so we recommend building something that's a more colloquial or condition-based algorithm.