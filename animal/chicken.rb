class Animal::Chicken < Animal
  def initialize(possession_player:)
    super
  end

  def validate_movable_range(current_position, moving_position)
    # TODO: ニワトリの移動可能な位置かを判定
  end

  def initial_position
    # do nothing
  end

  def shortened_name
    possession_player.first_move? ? 'P' : 'p'
  end
end
