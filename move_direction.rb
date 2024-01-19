class MoveDirection
  def initialize(from_instruction, to_instruction, player)
    @from_instruction = from_instruction
    @to_instruction = to_instruction
    @player = player
  end

  def advance_straight_ahead?
    !move_sideways? && advance?
  end

  def retreat_straight_back?
    !move_sideways? && retreat?
  end

  def sidestep?
    row_index_difference.zero? && move_sideways?
  end

  def diagonally_progress?
    move_sideways? && advance?
  end

  def diagonally_retreat?
    move_sideways? && retreat?
  end

  private
  def row_index_difference
    @from_instruction[:row_index] - @to_instruction[:row_index]
  end

  def advance?
    @player.first_move? ? row_index_difference.positive? : row_index_difference.negative?
  end

  def retreat?
    !advance?
  end

  def move_sideways?

  end
end
