class Animal::Giraffe < Animal
  def initialize(possession_player:)
    super
  end

  def validate_movable_range(current_position, moving_position)
    move_direction = MoveDirection.new(current_position, moving_position, possession_player)
    unless move_direction.advance_straight_ahead? || move_direction.retreat_straight_back? || move_direction.sidestep?
      raise InvalidAnimalMovableRangeError
    end
  end

  def shortened_name
    possession_player.first_move? ? 'G' : 'g'
  end

  def initial_position
    possession_player.first_move? ? 'C4' : 'A1'
  end
end
