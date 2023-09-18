class Rook < Piece
  def valid?(board, from_x, from_y, to_x, to_y)
    # Implementa la lógica específica para validar movimientos de torre
    from_x == to_x || from_y == to_y
  end
end