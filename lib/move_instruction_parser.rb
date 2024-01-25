class MoveInstructionParser
  def initialize(input)
    @input = input
  end

  attr_reader :input

  def parse
    # TODO: 命令形式のバリデーションを追加する
    column_position, row_position, shortened_name = input.chars
    { animal_class: shortened_name_to_class(shortened_name), column_index: alphabet_to_index(column_position), row_index: row_position.to_i - 1}
  end

  private

  def shortened_name_to_class(shortened_name)
    case shortened_name
    when 'L', 'l'
      Animal::Lion
    when 'C', 'c'
      Animal::Chick
    when 'P', 'p'
      Animal::Chicken
    when 'E', 'e'
      Animal::Elephant
    when 'G', 'g'
      Animal::Giraffe
    end
  end

  def alphabet_to_index(alphabet)
    case alphabet
    when 'A', 'a'
      0
    when 'B', 'b'
      1
    when 'C', 'c'
      2
    end
  end
end