class Queen < Piece
  
  def valid?(board, from_x, from_y, to_x, to_y)
    # Implementa la lógica específica para validar movimientos de reina
    x_diff = (to_x - from_x).abs
    y_diff = (to_y - from_y).abs
    x_diff == y_diff || from_x == to_x || from_y == to_y
  end
end