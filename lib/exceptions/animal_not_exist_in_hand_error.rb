class AnimalNotExistInHandError < StandardError
  def initialize(msg = '***指定の動物は手持ちに存在していません***')
    super
  end
end
