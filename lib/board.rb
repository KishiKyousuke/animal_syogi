require_relative 'diagram'

class Board
  include Diagram

  def initialize(placed_animals:)
    @positions = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil],
    ]
    # 盤上に存在している動物
    @placed_animals = placed_animals
  end

  attr_accessor :positions, :placed_animals

  def animal_exists?(row_index, column_index)
    !positions[row_index][column_index].nil?
  end

  def validate_animal_existence(animal, row_index, column_index)
    raise AnimalNotExistOnBoardError unless animal_exists?(row_index, column_index) && positions[row_index][column_index] == animal
  end

  def show_diagram
    generate_diagram_rows(self).each do |row|
      puts row
    end
  end

  def foremost_line?(player, row_index)
    foremost_line_index = player.first_move? ? 0 : 3
    row_index == foremost_line_index
  end
end
