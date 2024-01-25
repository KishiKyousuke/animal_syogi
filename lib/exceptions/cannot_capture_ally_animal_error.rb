# frozen_string_literal: true

class CannotCaptureAllyAnimalError < StandardError
  def initialize(msg='***味方の動物は取れません***')
    super
  end
end
