class Player
  def initialize(animals_in_hand:, first_move:)
    # 手駒
    @animals_in_hand = animals_in_hand
    # 先手番かどうか？
    @first_move = first_move
  end

  attr_reader :animals_in_hand, :first_move

  def move_animal(from:, to:)
    # TODO: 動物を移動させるメソッド
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
end
