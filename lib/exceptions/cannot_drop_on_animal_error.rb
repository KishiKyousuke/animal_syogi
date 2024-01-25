# frozen_string_literal: true

class CannotDropOnAnimalError < StandardError
  def initialize(msg='***動物の上に手持ちの動物は置けません***')
    super
  end
end
