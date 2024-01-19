require_relative '../../diagram'
require_relative '../../board'

RSpec.describe Board do

  describe '#movable?' do
  end

  describe '#show_diagram' do
    let!(:board) { Board.new(placed_animals: []) }
    let!(:output_diagram) do
      <<~DIAGRAM
        | A | B | C |
      1 |   |   |   |
      2 |   |   |   |
      3 |   |   |   |
      4 |   |   |   |
      DIAGRAM
    end

    it '局面図を標準出力に出力する' do
      expect { board.show_diagram }.to output(output_diagram).to_stdout
    end
  end
end
