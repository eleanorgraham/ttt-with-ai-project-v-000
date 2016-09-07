class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end
  #These methods relate to the state of the game:
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    (won? || draw?) ? true : false
  end

  def won?
    WIN_COMBINATIONS.any? do |wc|
      board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X" ||
      board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O"
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      WIN_COMBINATIONS.select do |wc|
        if board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X"
          return "X"
        elsif board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O"
          return "O"
        end
      end
    else
      nil
    end
  end

  #Methods related to managing a game

  def start

  end

  def play

  end

  def turn
    input = current_player.move
    if board.valid_move?(input) == true
      board.update(input, current_player)
    elsif board.valid_move?(input) == false
      puts "That is not a valid move."
      turn
    end
    board.display
  end

end
