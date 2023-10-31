require './board'

class TurnManager
  # class to check legal movements to provide them to the board just for printing the board

  # class in charge of managing the inputs from the users and checking if the entered input is a legal movement.
  # what does legal movement mean?
  # it means that the coordinates that the user is entering are inside of the limits of the matrix array from the chess.
  # then it has to check that at the piece level, that the movement that user is trying to move the piece at is legal and inside the range of the matrix. 
  # how the piece know that is making a legal movement? 
  # by the difference between coordinates.
  # We have to send to the piece we are moving, the current coordinate from its position, and the coordinate that we want the piece to move to.
  # and then the piece will check if the movement is a valid movement and if it's inside the range or the limits inside the matrix of the chess.
  # then the piece will send a response telling if it's a valid movement or not. then the board is the one to print itself for every move the current positions.

  def initialize(_board)
    @board = _board
  end

  def process_turn(player)
    puts "It\'s Now Turn For #{player.name}: "
    show_message = false

    # rastrear si el movimiento es válido
    movimiento_valido = false
    begin
      # ajustar para recibir
      input = gets.chomp
      coordenadas = input.split(' ')
      current_coordinate = coordenadas[0]
      to_coordinate = coordenadas[1]
      # input = ARGV[0..1]
      # current_coordinate = input[0]
      # to_coordinate = input[1]

      from_x, from_y = obtain_coordinate(current_coordinate)
      to_x, to_y = obtain_coordinate(to_coordinate)

      if from_x && to_x
        # buscar en my_board el spot que contenga las coordenadas from_x, from_y. y luego preguntar si la pieza:
        # no es nil, si la pieza es whiteSide porque es P1, sino devolver de lo contrario un mensaje 'la pieza no es tuya'
        # pero si es blanca obtener la pieza. y preguntarle a la pieza si el movimiento es valido.
        spot = @board.my_board[from_x][from_y]
        if spot.piece && spot.piece.color == 1 && player.white_side
          selected_piece = spot.releaseSpot
          @board.my_board[to_x][to_y].occupySpot(selected_piece)
          # if spot.piece.valid?
          # la pieza es la unica que dice si su movimiento es valido
          # execute movement
        elsif spot.piece && spot.piece.color == 0 && !player.white_side
          selected_piece = spot.releaseSpot
          @board.my_board[to_x][to_y].occupySpot(selected_piece)
        end
      end
      puts 'Invalid movement. Please Try Again: ' unless from_x && to_x
    end until from_x && to_x
    # to_X deberia ser reemplazado por valid movement de la pieza en juego

    @board.print_board
  end

  def obtain_coordinate(coordenada)

    unless coordenada.match?(/^[A-Ha-h][1-8]$/)
      puts "Wrong input #{coordenada}"
      return nil
    end

    # Mapea las letras a índices numéricos
    letra_a_numero = {
      'A' => 0,
      'B' => 1,
      'C' => 2,
      'D' => 3,
      'E' => 4,
      'F' => 5,
      'G' => 6,
      'H' => 7
    }

    letra_a_numero_lowercase = letra_a_numero.map { |k, v| [k.downcase, v] }.to_h
    letra_a_numero.merge!(letra_a_numero_lowercase)

    # Extrae la letra y el número de "coordenada"
    letra = coordenada[0]
    numero = coordenada[1].to_i

    # Convierte la coordenada al formato de índices de matriz
    x = letra_a_numero[letra]
    y = numero - 1

    # Verifica si la coordenada está dentro del rango válido (1-8)
    if x.between?(0, 7) && y.between?(0, 7)
      [x, y]
    else
      nil # Devuelve nil si la coordenada no es válida
    end
  end
end