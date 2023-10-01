class Knight < Piece
  
  def valid?(board, from_x, from_y, to_x, to_y)
    # Implementa la lógica específica para validar movimientos de caballo
    x_diff = (to_x - from_x).abs
    y_diff = (to_y - from_y).abs
    # Verificamos si el movimiento es en forma de "L"
    (x_diff == 2 && y_diff == 1) || (x_diff == 1 && y_diff == 2)
  end
end


# La lógica del método es la siguiente:

# Calcula las diferencias en las coordenadas X e Y entre el punto de partida y el punto de destino (x_diff y y_diff).

# Verifica si el movimiento es válido para un caballo en forma de "L". Un movimiento válido será cuando x_diff sea igual a 2 y 
#y_diff sea igual a 1 (dos cuadros en una dirección y uno en la dirección perpendicular) o cuando x_diff sea igual a 1 y y_diff sea igual a 2 (uno en una dirección y dos en la dirección perpendicular).