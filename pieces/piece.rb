#require '../board'

class Piece
  
  attr_accessor :available, :x, :y
  attr_reader :color

  def initialize(_available, _x, _y, _color)
    @available = true
    @x = _x
    @y = _y
    @color = _color
    #@board = _board
  end

  # Abstract method that should be implemented by subclasses
  def valid?(from_x, from_y, to_x, to_y)
    raise NotImplementedError, 'subclasses must implement this method'
  end
end
