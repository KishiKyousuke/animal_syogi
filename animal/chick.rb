class Animal::Chick < Animal
  def initialize(possession_player:)
    super
  end

  def movable?(current_position, moving_position)
    # TODO: ひよこの移動可能な位置かを判定
  end

  def grow_up
    # TODO: ニワトリに成るメソッド
  end
end
