class InputParser
  def initialize(input)
    @input = input
    @from, @to = split_input
  end

  INPUT_REGEXP = /\A[ABC][1234][LGECPlgecp]\z/

  def parse
    validate_input
    [@from, @to]
  end

  private

  def split_input
    processed_input = @input.chomp.gsub(' ', '').split(',')
    processed_input.size == 1 ? [nil, processed_input.first] : processed_input
  end

  def validate_input
    raise InvalidInputError unless alphanumeric_format_valid? && animal_shortened_name_match?
  end

  def alphanumeric_format_valid?
    return false if @to.nil?

    @from.nil? ? @to.match?(INPUT_REGEXP) : @from.match?(INPUT_REGEXP) && @to.match?(INPUT_REGEXP)
  end

  def animal_shortened_name_match?
    return false if @to.nil?
    return true if @from.nil?

    from_shortened_name = @from.chars.last
    to_shortened_name = @to.chars.last
    from_shortened_name == to_shortened_name
  end
end
