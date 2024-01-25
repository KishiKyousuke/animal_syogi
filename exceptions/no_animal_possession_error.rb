class NoAnimalPossessionError < StandardError
  def initialize(msg = '***相手の動物を指定することはできません***')
    super
  end
end
