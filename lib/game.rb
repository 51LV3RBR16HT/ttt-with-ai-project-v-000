require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new, wargames = false)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @wargames = wargames
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
    # Because you have access to the Board class, you can include the
    # turn_count method in your current_player method.
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      @board.cells[win[0]] == @board.cells[win[1]] &&
      @board.cells[win[1]] == @board.cells[win[2]] &&
      @board.taken?(win[0] + 1)
      # (@board.cells[win[0]] == "X" || @board.cells[win[0]] == "O")
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      @winner = @board.cells[win_combo.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    puts "Game #{@counter}" if @wargame
     board.display
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
    end
  end

  def play
    puts "Game #{@counter}" if @wargames
    board.display
    turn until over?
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
     end
   end

   def wargames
     display.board
     @counter = 0
      x = 0
      o = 0
      draw = 0
    until @counter == 100
      @counter += 1
      play
      if draw?
        draw += 1
      elsif winner == "X"
        x += 1
      elsif winner == "O"
        o += 1
      end
      # sleep(@timer*1.5)
      # @timer -= (@timer/3)
      # end

  end
  puts "A STRANGE GAME. THE ONLY WINNING MOVE IS NOT TO PLAY."
  puts "HOW ABOUT A NICE GAME OF CHESS?"
end
puts "test"
end
