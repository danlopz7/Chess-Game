require '../pieces/bishop'
require '../pieces/king'
require '../pieces/knight'
require '../pieces/pawn'
require '../pieces/queen'
require '../pieces/rook'
require './player'

class RobotPlayer < Player

  # Jugador robot siempre es un jugador no humano
  def initialize(_name, white_side)
    super(_name, _white_side, false) 
  end

  def initialize_pieces
    if white_side
      8.times do |i| 
        @pieces << Pawn.new(1, i, 1)
      end
      @pieces << Bishop.new(0, 2, 1)
      @pieces << Bishop.new(0, 5, 1)
      @pieces << Rook.new(0, 0, 1)
      @pieces << Rook.new(0, 7, 1)
      @pieces << Knight.new(0, 1, 1)
      @pieces << Knight.new(0, 6, 1)
      @pieces << Queen.new(0, 3, 1)
      @pieces << King.new(0, 4, 1)
    else
      8.times do |i|
        @pieces << Pawn.new(6, i, 0)
      end
      @pieces << Bishop.new(7, 2, 0)
      @pieces << Bishop.new(7, 5, 0)
      @pieces << Rook.new(7, 0, 1)
      @pieces << Rook.new(7, 7, 1)
      @pieces << Knight.new(7, 1, 1)
      @pieces << Knight.new(7, 6, 1)
      @pieces << Queen.new(7, 3, 1)
      @pieces << King.new(7, 4, 1)
    end
  end
end