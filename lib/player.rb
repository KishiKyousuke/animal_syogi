class Player
  def initialize(animals_in_hand:, first_move:)
    # 手駒
    @animals_in_hand = animals_in_hand
    # 先手番かどうか？
    @first_move = first_move
    @name = first_move ? '先手' : '後手'
  end

  attr_accessor :animals_in_hand
  attr_reader :first_move, :name

  def move_animal(board:, from:, to:)
    if from.nil?
      drop_from_hand(board, to)
    else
      move_from(board, from, to)
    end
  end

  def first_move?
    first_move
  end

  def show_hands
    animals_in_hand.map(&:shortened_name).join(', ')
  end

  private

  def drop_from_hand(board, to)
    from_instruction = MoveInstructionParser.new(to).parse
    move_animal_index = animals_in_hand.find_index { |animal_in_hand| animal_in_hand.is_a?(from_instruction[:animal_class]) }
    raise AnimalNotExistInHandError if move_animal_index.nil?
    raise CannotDropOnAnimalError if board.animal_exists?(from_instruction[:row_index], from_instruction[:column_index])

    move_animal = animals_in_hand.delete_at(move_animal_index)
    board.positions[from_instruction[:row_index]][from_instruction[:column_index]] = move_animal
    board.placed_animals << move_animal
  end

  def move_from(board, from, to)
    from_instruction = MoveInstructionParser.new(from).parse
    to_instruction = MoveInstructionParser.new(to).parse

    moving_animal = board.positions[from_instruction[:row_index]][from_instruction[:column_index]]
    existing_animal = board.positions[to_instruction[:row_index]][to_instruction[:column_index]]

    board.validate_animal_existence(moving_animal, from_instruction[:row_index], from_instruction[:column_index])
    raise NoAnimalPossessionError if moving_animal.possession_player != self
    moving_animal.validate_movable_range(from_instruction, to_instruction)

    capture_animal(board, existing_animal) if existing_animal
    if board.foremost_line?(self, to_instruction[:row_index]) && moving_animal.respond_to?(:grow_up)
      moving_animal = moving_animal.grow_up
      board.placed_animals << moving_animal
    end

    board.positions[from_instruction[:row_index]][from_instruction[:column_index]] = nil
    board.positions[to_instruction[:row_index]][to_instruction[:column_index]] = nil
    board.positions[to_instruction[:row_index]][to_instruction[:column_index]] = moving_animal
  end

  def capture_animal(board, animal)
    raise CannotCaptureAllyAnimalError if animal.possession_player == self
    captured_animal_index = board.placed_animals.find_index { |placed_animal| placed_animal == animal }
    captured_animal = board.placed_animals.delete_at(captured_animal_index)
    animals_in_hand << captured_animal
    captured_animal.possession_player = self
  end
end
