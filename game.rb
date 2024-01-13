class Game
  def initialize
    @sente = Player.new(animals: build_sente_animals, first_move: true)
    @gote = Player.new(animals: build_gote_animals, first_move: false)
    @board = build_board
  end

  def start
    # TODO: ゲーム開始メソッド
  end

  def build_sente_animals
    # TODO: 先手の駒を用意
  end

  def build_gote_animals
    # TODO: 後手の駒を用意
  end

  def build_board
    # TODO: ボードを用意して駒を並べる
  end
end
