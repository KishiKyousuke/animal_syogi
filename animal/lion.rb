class Animal::Lion < Animal
  def initialize(possession_player:)
    super
  end

  def shortened_name
    possession_player.first_move? ? 'L' : 'l'
  end

  def initial_position
    possession_player.first_move? ? 'B4' : 'B1'
  end

  def movable?(current_position, moving_position)
    # TODO: ライオンの移動可能な位置かを判定
  end
end
