require './pieces/piece'
require './pieces/pawn'
require './pieces/rook'
require './pieces/knight'
require './pieces/queen'
require './pieces/king'
require './player/player'
require './pieces/bishop'
require './player/human_player'
require './spot'

# class in charge to print the board with the right position of the pieces for every player turn. 

class Board

  attr_reader :my_board, :win

  def initialize(_p1, _p2)
    @spots = Array.new(8) { Array.new(8) }
    @p1 = _p1
    @p2 = _p2
    @my_board = nil
    @console_board = nil
    @win = false
  end

  def initBoard
    puts '$$$Welcome to my Chess game$$$'
    setup_board
  end

  def setup_board
    # condicion de si es primera vez, imprimir el board de inicio
    @console_board = Array.new(9) { Array.new(9, '·') }

    # Agregar números en la primera fila
    (1..8).each_with_index do |num, index|
      @console_board[0][index + 1] = num.to_s
    end
    # Agregar letras en la primera columna
    ('A'..'H').each_with_index do |letter, index|
      @console_board[index + 1][0] = letter
    end

    @my_board = Array.new(8) { Array.new(8, '·') }
    # inicializar los spots y asignarle la coordenada contendra el spot
    (0..7).each do |i|
      (0..7).each do |j|
        # fila #columna
        @my_board[i][j] = Spot.new(i, j)
      end
    end

    assign_pieces_to_spots(@my_board, @p1)
    assign_pieces_to_spots(@my_board, @p2)
    print_board
  end

  def print_board
    @my_board.each_with_index do |row, i|
      row.each_with_index do |spot, j|
        if spot.piece && spot.piece.available
          @console_board[i + 1][j + 1] = get_piece_character(spot.piece)
        else
          @console_board[i + 1][j + 1] = '·'
        end
      end
    end

    @console_board.each { |row| puts row.join(' ') }
    @console_board
  end

  def get_piece_character(piece)
    white_pieces = %w[♜ ♞ ♝ ♛ ♚ ♟]
    black_pieces = %w[♖ ♘ ♗ ♕ ♔ ♙]

    if piece.nil?
      '·' # Si no hay pieza en el spot, se usa el carácter · (punto)
    else
      piece_char = case piece
                   when Rook
                     piece.color == 1 ? white_pieces[0] : black_pieces[0]
                   when Knight
                     piece.color == 1 ? white_pieces[1] : black_pieces[1]
                   when Bishop
                     piece.color == 1 ? white_pieces[2] : black_pieces[2]
                   when Queen
                     piece.color == 1 ? white_pieces[3] : black_pieces[3]
                   when King
                     piece.color == 1 ? white_pieces[4] : black_pieces[4]
                   when Pawn
                     piece.color == 1 ? white_pieces[5] : black_pieces[5]
                   else
                     '·' # Carácter por defecto si no se reconoce el tipo de pieza
                   end
      piece_char
    end

    # piece_characters = {
    #   Rook => ->(color) { color == 1 ? '♜' : '♖' },
    #   Knight => ->(color) { color == 1 ? '♞' : '♘' },
    #   Bishop => ->(color) { color == 1 ? '♝' : '♗' },
    #   Queen => ->(color) { color == 1 ? '♛' : '♕' },
    #   King => ->(color) { color == 1 ? '♚' : '♔' },
    #   Pawn => ->(color) { color == 1 ? '♟' : '♙' }
    # }
    # spot.piece ? piece_characters[spot.piece.class].call(spot.piece.color) : '·'
  end

  def assign_pieces_to_spots(board, player)
    # Determinar la fila de asignación basada en @white_side
    pawn_row = player.white_side ? 1 : 6
    row = player.white_side ? 0 : 7

    player.pieces.each do |piece|
      case piece
      when Pawn
        # Asignar Pawn en la segunda fila (fila 1) o penúltima fila (fila 6)
        8.times { |col| board[pawn_row][col].occupySpot(piece) }
      when Rook
        # Asignar Rook en las esquinas (0,0) y (0,7) o (7,0) y (7,7)
        board[row][0].occupySpot(piece)
        board[row][7].occupySpot(piece)
      when Bishop
        # Asignar Bishop en (0,2) y (0,5) o (7,2) y (7,5)
        board[row][2].occupySpot(piece)
        board[row][5].occupySpot(piece)
      when Knight
        # Asignar Knight en (0,1) y (0,6) o (7,1) y (7,6)
        board[row][1].occupySpot(piece)
        board[row][6].occupySpot(piece)
      when Queen
        # Asignar Queen en (0,3) o (7,3)
        board[row][3].occupySpot(piece)
      when King
        # Asignar King en (0,4) o (7,4)
        board[row][4].occupySpot(piece)
      end
    end
  end

  # def execute_move(from_x, from_y, to_x, to_y)
  
  
  # end

end
