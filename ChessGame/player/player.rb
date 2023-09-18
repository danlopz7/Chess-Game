class Player
  attr_reader :white_side, :human_player, :pieces, :name

  def initialize(_name, _white_side, _human_player)
    @name = _name
    @white_side = _white_side
    @human_player = _human_player
    @pieces = []
    initialize_pieces
  end

  # Abstract method that should be implemented by subclasses
  def initialize_pieces
    raise NotImplementedError, "subclasses must implement this method"
  end
end