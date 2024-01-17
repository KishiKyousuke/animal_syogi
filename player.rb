class Player
  def initialize(animals_in_hand:, first_move:)
    # 手駒
    @animals_in_hand = animals_in_hand
    # 先手番かどうか？
    @first_move = first_move
  end

  attr_accessor :animals_in_hand
  attr_reader :first_move

  def move_animal(board:, from:, to:)
    if from.nil?
      drop_from_hand(board, to)
    else
      move_from(board, from, to)
    end
  end

  def capture(animal)
    # TODO: 相手の動物を獲得するメソッド
  end

  def win(game)
    # TODO: 勝利が決定するメソッド
  end

  def first_move?
    first_move
  end

  def show_hands
    animals_in_hand.map(&:shortened_name).join(', ')
  end

  private

  def drop_from_hand(board, to)
    animal_class, key, index = MoveInstructionParser.new(to).parse.values_at(:animal_class, :column_key, :row_index)
    move_animal_index = animals_in_hand.find_index { |animal_in_hand| animal_in_hand.is_a?(animal_class) }
    move_animal = animals_in_hand.delete_at(move_animal_index)
    # TODO: boardの指定位置に駒が存在するかどうかの判定が必要
    board.positions[index][key] = move_animal
    board.placed_animals << move_animal
  end

  def move_from(board, from, to)
    animal_class, from_key, from_index = MoveInstructionParser.new(from).parse.values
    animal = board.positions[from_index][from_key]
    # TODO: 指定したanimalが存在するかのチェック
    board.positions[from_index][from_key] = nil
    _animal_class, to_key, to_index = MoveInstructionParser.new(to).parse.values
    # TODO: 指定したanimalがその動きができるかのチェック
    # TODO: 移動先が正しいかのチェック
    # TODO: 移動後の処理（capture, try, growなど）
    board.positions[to_index][to_key] = animal
  end
end
