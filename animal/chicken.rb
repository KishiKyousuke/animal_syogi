class Animal::Chicken < Animal
  def initialize(possession_player:)
    super
  end

  def movable?(current_position, moving_position)
    # TODO: ニワトリの移動可能な位置かを判定
  end
end
