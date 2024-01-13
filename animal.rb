class Animal
  def initialize(possession_player:)
    @possession_player = possession_player
  end

  def initial_position
    # TODO: 先手か後手かによって変わる初期配置を返す
  end

  def movable?(current_position, moving_position)
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end

  def shortened_name
    # TODO: 局面図上での名前を返す
  end
end
