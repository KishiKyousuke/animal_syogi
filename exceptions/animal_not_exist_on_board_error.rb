class AnimalNotExistOnBoardError < StandardError
  def initialize(msg="***指定位置に指定の動物は存在していません***")
    super
  end
end
