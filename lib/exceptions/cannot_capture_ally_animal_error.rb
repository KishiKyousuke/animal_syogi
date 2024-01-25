# frozen_string_literal: true

class CannotCaptureAllyAnimalError < StandardError
  def initialize
    super('***味方の動物は取れません***')
  end
end
