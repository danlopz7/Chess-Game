require './pieces/bishop'
require './pieces/king'
require './pieces/knight'
require './pieces/pawn'
require './pieces/queen'
require './pieces/rook'

# this class is about what every spot has on the matrix from the chess. it is composed by coordinates(x, y) and one piece from a player.
class Spot

  attr_reader :status, :piece
  
  def initialize(x, y)
    @x = x
    @y = y
    @piece = nil
  end

  # return original piece
  def occupySpot(piece)
    current_piece = @piece
    # if a piece is already here, delete it, i. e. set it dead
    # when a piece is about to kill another and occupy its space
    # then set the piece unavailable
    # Si current_piece no es nulo (es decir, si current_piece tiene un valor), entonces se establecerá @piece.available en false.
    # Si current_piece es nulo, no se ejecutará la asignación y @piece.available mantendrá su valor actual. 
    @piece.available = false unless current_piece.nil?
    # place piece here
    @piece = piece
  end

  def releaseSpot
    releasedPiece = @piece
    @piece = nil
    releasedPiece
  end

  def isOccupied
    !@piece.nil?
  end

  def set_status(status)
    @status = status
  end
end
