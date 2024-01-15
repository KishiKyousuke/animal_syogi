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
      animal_class, key, index = MoveInstructionParser.new(to).parse.values_at(:animal_class, :column_key, :row_index)
      animal = animals_in_hand.find { |animal_in_hand| animal_in_hand.is_a?(animal_class) }
      # TODO: boardの指定位置に駒が存在するかどうかの判定が必要
      board.positions[index][key] = animal
      board.placed_animals << animal
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
end
