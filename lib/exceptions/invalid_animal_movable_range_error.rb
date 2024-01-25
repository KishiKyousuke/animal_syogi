class InvalidAnimalMovableRangeError < StandardError
  def initialize(msg = '※※※動物の移動可能範囲外です️※※※')
    super
  end
end
