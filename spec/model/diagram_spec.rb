require_relative '../../diagram'
require_relative '../../board'
require_relative '../../player'
require_relative '../../animal'
require_relative '../../animal/chick'
require_relative '../../animal/elephant'
require_relative '../../animal/giraffe'
require_relative '../../animal/lion'

RSpec.describe Diagram do
  describe '#generate_diagram_rows' do
    let(:board) { Board.new(placed_animals: []) }

    it '局面図の各列を格納した配列を返す' do
      expect(board.generate_diagram_rows(board)).to eq [
        '  | A | B | C |',
        '1 |   |   |   |',
        '2 |   |   |   |',
        '3 |   |   |   |',
        '4 |   |   |   |',
      ]
    end

    context '盤上に動物が存在する場合' do
      let!(:sente) { Player.new(animals_in_hand: [], first_move: true) }
      let!(:gote) { Player.new(animals_in_hand: [], first_move: false) }
      let!(:sente_chick) { Animal::Chick.new(possession_player: sente) }
      let!(:sente_lion) { Animal::Lion.new(possession_player: sente) }
      let!(:sente_giraffe) { Animal::Giraffe.new(possession_player: sente) }
      let!(:sente_elephant) { Animal::Elephant.new(possession_player: sente) }
      let!(:gote_chick) { Animal::Chick.new(possession_player: gote) }
      let!(:gote_lion) { Animal::Lion.new(possession_player: gote) }
      let!(:gote_giraffe) { Animal::Giraffe.new(possession_player: gote) }
      let!(:gote_elephant) { Animal::Elephant.new(possession_player: gote) }
      let!(:board) { Board.new(placed_animals: [sente_chick, sente_lion, sente_giraffe, sente_elephant, gote_chick, gote_lion, gote_giraffe, gote_elephant]) }

      before do
        # 先手初期配置
        board.positions[3][:A] = sente_elephant
        board.positions[3][:B] = sente_lion
        board.positions[3][:C] = sente_giraffe
        board.positions[2][:B] = sente_chick

        # 後手初期配置
        board.positions[0][:A] = gote_giraffe
        board.positions[0][:B] = gote_lion
        board.positions[0][:C] = gote_elephant
        board.positions[1][:B] = gote_chick
      end

      it '局面図の各列を格納した配列を返す' do
        expect(board.generate_diagram_rows(board)).to eq [
          '  | A | B | C |',
          '1 | g | l | e |',
          '2 |   | c |   |',
          '3 |   | C |   |',
          '4 | E | L | G |',
        ]
      end
    end
  end
end
