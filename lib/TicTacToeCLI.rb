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
    player = gets.strip
  end

end
