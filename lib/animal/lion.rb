require_relative '../animal'

class Animal::Lion < Animal
  def initialize(possession_player:)
    super
  end

  def validate_movable_range(current_position, moving_position)
    move_direction = MoveDirection.new(current_position, moving_position, possession_player)
    unless move_direction.advance_straight_ahead? || move_direction.retreat_straight_back? || move_direction.sidestep? || move_direction.diagonally_progress? || move_direction.diagonally_retreat?
      raise InvalidAnimalMovableRangeError
    end
  end

  def shortened_name
    possession_player.first_move? ? 'L' : 'l'
  end

  def initial_position
    possession_player.first_move? ? 'B4' : 'B1'
  end
end
