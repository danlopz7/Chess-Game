class Pawn < Piece
  
  def valid?(board, from_x, from_y, to_x, to_y)
    # Implementa la lógica específica para validar movimientos de peón
    x_diff = (to_x - from_x).abs
    y_diff = to_y - from_y
    
    if color == 1  # Peón blanco
      (x_diff == 1 && y_diff == 1) || (x_diff == 0 && y_diff == 1)
    else  # Peón negro
      (x_diff == 1 && y_diff == -1) || (x_diff == 0 && y_diff == -1)
    end
    
  end
end