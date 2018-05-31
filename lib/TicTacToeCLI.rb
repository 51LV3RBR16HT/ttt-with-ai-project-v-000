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

    if input == "1"
      Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
    else
      Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
    end

  end



end
