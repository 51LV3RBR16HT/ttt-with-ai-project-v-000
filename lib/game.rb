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

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # def call
  #   puts "Welcome to Tic Tac Toe,"
  #   puts "Please choose 1. Player vs Player 2. Player vs Computer or 3. Computer vs Computer"
  #
  #   user_input = gets.strip
  #
  #   if user_input == "1"
  #     game = Game.new()
  #     game.board.display
  #   elsif user_input == "2"
  #     game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
  #     game
  #   else
  #     game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
  #     game
  #   end
  #   game.play
  # end

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
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
    end
  end

  def play
    turn until over?
    if draw?
      puts "Cat's Game!"
    else won?
      puts "Congratulations #{winner}!"
     end
   end

end
