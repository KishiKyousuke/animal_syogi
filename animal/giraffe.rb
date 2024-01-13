class Animal::Giraffe < Animal
  def initialize(possession_player:)
    super
  end

  def movable?(current_position, moving_position)
    # TODO: キリンの移動可能な位置かを判定
  end

  def shortened_name
    possession_player.first_move? ? 'G' : 'g'
  end

  def initial_position
    possession_player.first_move? ? 'C4' : 'A1'
  end
end
