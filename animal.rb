class Animal
  def initialize(possession_player:)
    @possession_player = possession_player
  end

  attr_reader :possession_player

  def initial_position
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end

  def movable?(current_position, moving_position)
    # raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end

  def shortened_name
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end
end
