class Player
  def initialize(animals:, first_move:)
    # 自分の操作可能な動物
    @animals = animals
    # 先手番かどうか？
    @first_move = first_move
  end

  attr_reader :animals, :first_move

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
