require './board'
require './player/player'
require './player/human_player'
require './turn_manager'

# class in charge of creating players, create a new board, assing players turns and check who the winner is.

class ChessGame
  def initialize
    @p1 = HumanPlayer.new('PLAYER 1', true)
    @p2 = HumanPlayer.new('PLAYER 2', false)
    # @status = GameStatus::ACTIVE
    @board = Board.new(@p1, @p2)
    @tm = TurnManager.new(@board)
    setup
  end

  def setup
    @board.initBoard
    start_game
  end

  def start_game
    loop do
      @tm.process_turn(@p1)
      if @board.win
        puts 'P1 win!'
        break
      end

      @tm.process_turn(@p2)
      if @board.win
        puts 'P2 win!'
        break
      end
    end
  end

  # def get_status
  #   @status
  # end

  # def set_status(status)
  #   @status = status
  # end

  # def is_end
  #   get_status != GameStatus::ACTIVE
  # end
end
