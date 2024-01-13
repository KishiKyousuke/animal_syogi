class Animal::Elephant < Animal
  def initialize(possession_player:)
    super
  end

  def shortened_name
    possession_player.first_move? ? 'E' : 'e'
  end

  def initial_position
    possession_player.first_move? ? 'A4' : 'C1'
  end

  def movable?(current_position, moving_position)
    # TODO: ゾウの移動可能な位置かを判定
  end
end
