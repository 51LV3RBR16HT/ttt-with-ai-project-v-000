class TicTacToeCLI

  def call
    puts "Let's play Tic Tac Toe!  Please choose how many players: 0, 1, 2."

    input = gets.strip

    if input == "2"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
    end



  end



end
