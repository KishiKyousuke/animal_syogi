class Animal::Elephant < Animal
  def initialize(possession_player:)
    super
  end

  def validate_movable_range(current_position, moving_position)
    move_direction = MoveDirection.new(current_position, moving_position, possession_player)
    unless move_direction.diagonally_progress? || move_direction.diagonally_retreat?
      raise InvalidAnimalMovableRangeError
    end
  end

  def shortened_name
    possession_player.first_move? ? 'E' : 'e'
  end

  def initial_position
    possession_player.first_move? ? 'A4' : 'C1'
  end
end
