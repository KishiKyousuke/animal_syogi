module Diagram
  HEADERS = [nil, 'A', 'B', 'C']

  def generate_diagram_rows(board)
    board.positions.map.with_index(1) do |position, i|
      shortened_names_with_index = position.values.map { |animal| animal&.shortened_name }.unshift(i)
      divide_into(shortened_names_with_index)
    end.unshift(divide_into(HEADERS))
  end

  private

  def divide_into(cells)
    cells_for_display = cells.map { |cell| cell.nil? ? ' ' : cell }
    cells_for_display.join(' | ') + ' |'
  end
end
