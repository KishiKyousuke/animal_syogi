module Diagram
  HEADERS = [nil, 'A', 'B', 'C']

  def generate_diagram_rows(board)
    board.positions.map.with_index(1) do |position, i|
      shortened_names_and_row_number = position.map { |animal| animal&.shortened_name }.unshift(i)
      divide_into_cells(shortened_names_and_row_number)
    end.unshift(divide_into_cells(HEADERS))
  end

  private

  def divide_into_cells(items)
    cells_for_display = items.map { |cell| cell.nil? ? ' ' : cell }
    cells_for_display.join(' | ') + ' |'
  end
end
