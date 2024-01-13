class Board
  def initialize(animals)
    @position = [
      {A: nil, B: nil, C: nil},
      {A: nil, B: nil, C: nil},
      {A: nil, B: nil, C: nil},
      {A: nil, B: nil, C: nil},
    ]
    # 盤上に存在している動物
    @animals = animals
  end

  def movable?(current_position, moving_position)
    # TODO: 指定された位置に移動可能かを判定する
  end

  def diagram
    # TODO: 局面図を返す
  end
end
