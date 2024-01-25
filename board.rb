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
    raise NoAnimalExistError unless animal_exists?(row_index, column_index) && positions[row_index][column_index] == animal
  end

  def movable?(current_position, moving_position)
    # TODO: 指定された位置に移動可能かを判定する
  end

  def show_diagram
    generate_diagram_rows(self).each do |row|
      puts row
    end
  end
end
