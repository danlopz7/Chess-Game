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
        @pieces << Pawn.new(true, 1, i, 1)
      end
      @pieces << Bishop.new(true, 0, 2, 1)
      @pieces << Bishop.new(true, 0, 5, 1)
      @pieces << Rook.new(true, 0, 0, 1)
      @pieces << Rook.new(true, 0, 7, 1)
      @pieces << Knight.new(true, 0, 1, 1)
      @pieces << Knight.new(true, 0, 6, 1)
      @pieces << Queen.new(true, 0, 3, 1)
      @pieces << King.new(true, 0, 4, 1)
    else
      8.times do |i|
        @pieces << Pawn.new(true, 6, i, 0)
      end
      @pieces << Bishop.new(true, 7, 2, 0)
      @pieces << Bishop.new(true, 7, 5, 0)
      @pieces << Rook.new(true, 7, 0, 1)
      @pieces << Rook.new(true, 7, 7, 1)
      @pieces << Knight.new(true, 7, 1, 1)
      @pieces << Knight.new(true, 7, 6, 1)
      @pieces << Queen.new(true, 7, 3, 1)
      @pieces << King.new(true, 7, 4, 1)
    end
  end
end