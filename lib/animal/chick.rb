require_relative '../animal'

class Animal::Chick < Animal
  def initialize(possession_player:)
    super
  end

  def validate_movable_range(from_instruction, to_instruction)
    move_direction = MoveDirection.new(from_instruction, to_instruction, possession_player)
    raise InvalidAnimalMovableRangeError unless move_direction.advance_straight_ahead?
  end

  def shortened_name
    possession_player.first_move? ? 'C' : 'c'
  end

  def initial_position
    possession_player.first_move? ? 'B3' : 'B2'
  end

  def grow_up
    # TODO: ニワトリに成るメソッド
  end
end
