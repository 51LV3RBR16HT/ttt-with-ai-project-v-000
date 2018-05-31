module Players
  class Human < Player

    def move(board)
      puts "Please make your selection."
        input = gets
        input
        @board.display
      end
    end

end
