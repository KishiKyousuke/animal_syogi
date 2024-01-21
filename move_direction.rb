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

  def column_index_difference
    @from_instruction[:column_index] - @to_instruction[:column_index]
  end

  def advance?
    @player.first_move? ? row_index_difference == 1 : row_index_difference == -1
  end

  def retreat?
    @player.first_move? ? row_index_difference == -1 : row_index_difference == 1
  end

  def move_sideways?
    @from_instruction[:column_index] != @to_instruction[:column_index] && column_index_difference.abs == 1
  end
end
