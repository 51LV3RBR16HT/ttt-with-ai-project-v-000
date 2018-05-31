class TicTacToeCLI

  def call
    "Greetings, Professor Falken.\r\n".each_char do |c| #sleep 0.1
      print c
    end
    #sleep 1
    "Shall we play a game of Tic Tac Toe?\r\n".each_char do |c| #sleep 0.1
      print c
    end
     #sleep 1
     "Please choose the following: 0, 1, or 2 players.\r\n".each_char do |c| #sleep 0.1
       print c
    end
    input = gets.strip

    if input == "2"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
    end
    @board.display


  end



end
