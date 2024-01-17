class InputParser
  def initialize(input)
    @input = input
  end

  def parse
    from, to = @input.split(',')
    # TODO: Inputのバリデーションはここで行う？
    [from, to]
  end
end
