RSpec.describe MoveDirection do
  let(:player) { Player.new(animals_in_hand: [], first_move:) }
  let(:move_direction) { MoveDirection.new(from_instruction, to_instruction, player) }

  describe '#advance_straight_ahead?' do
    context '先手の場合' do
      let(:first_move) { true }
      let(:from_instruction) { { row_index: 2, column_index: 1 } }

      context '前進するとき' do
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq true }
      end

      context '2マス前進するとき' do
        let(:to_instruction) { { row_index: 0, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '後退するとき' do
        let(:to_instruction) { { row_index: 3, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '横に移動する時' do
        let(:to_instruction) { { row_index: 2, column_index: [0, 2].sample } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '斜め前に移動するとき' do
        let(:to_instruction) { { row_index: 1, column_index: [0, 2].sample } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '停滞するとき' do
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end
    end

    context '後手の場合' do
      let(:first_move) { false }
      let(:from_instruction) { { row_index: 1, column_index: 1 } }

      context '前進するとき' do
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq true }
      end

      context '2マス前進するとき' do
        let(:to_instruction) { { row_index: 3, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '後退するとき' do
        let(:to_instruction) { { row_index: 0, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '横に移動する時' do
        let(:to_instruction) { { row_index: 1, column_index: [0, 2].sample } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '斜め前に移動するとき' do
        let(:to_instruction) { { row_index: 2, column_index: [0, 2].sample } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '停滞するとき' do
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end
    end
  end

  describe '#retreat_straight_back?' do
    context '先手の場合' do
      let(:first_move) { true }
      let(:from_instruction) { { row_index: 2, column_index: 1 } }

      context '前進するとき' do
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '後退するとき' do
        let(:to_instruction) { { row_index: 3, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq true }
      end

      context '2マス後退するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 3, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '横に移動する時' do
        let(:to_instruction) { { row_index: 1, column_index: [0, 2].sample } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '斜め後ろに移動するとき' do
        let(:to_instruction) { { row_index: 1, column_index: [0, 2].sample } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '停滞するとき' do
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end
    end

    context '後手の場合' do
      let(:first_move) { false }
      let(:from_instruction) { { row_index: 1, column_index: 1 } }

      context '前進するとき' do
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '後退するとき' do
        let(:to_instruction) { { row_index: 0, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq true }
      end

      context '2マス後退するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 0, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '横に移動する時' do
        let(:to_instruction) { { row_index: 2, column_index: [0, 2].sample } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '斜め後ろに移動するとき' do
        let(:to_instruction) { { row_index: 2, column_index: [0, 2].sample } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '停滞するとき' do
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end
    end
  end

  describe '#sidestep?' do
    let(:first_move) { [true, false].sample }
    let(:from_instruction) { { row_index: 1, column_index: 1 } }

    context '横に移動するとき' do
      let(:to_instruction) { { row_index: 1, column_index: 2 } }

      it { expect(move_direction.sidestep?).to eq true }
    end

    context '2マス横に移動するとき' do
      let(:from_instruction) { { row_index: 1, column_index: 0 } }
      let(:to_instruction) { { row_index: 1, column_index: 2 } }

      it { expect(move_direction.sidestep?).to eq false }
    end

    context '前進または後退するとき' do
      let(:to_instruction) { { row_index: 2, column_index: 1 } }

      it { expect(move_direction.sidestep?).to eq false }
    end

    context '斜めに移動するとき' do
      let(:to_instruction) { { row_index: 2, column_index: 2 } }

      it { expect(move_direction.sidestep?).to eq false }
    end

    context '停滞するとき' do
      let(:to_instruction) { { row_index: 1, column_index: 1 } }

      it { expect(move_direction.sidestep?).to eq false }
    end
  end

  describe '#diagonally_progress?' do
    context '先手の場合' do
      let(:first_move) { true }
      let(:from_instruction) { { row_index: 2, column_index: 1 } }

      context '前進または後退するとき' do
        let(:to_instruction) { { row_index: [1, 3].sample, column_index: 1 } }

        it { expect(move_direction.diagonally_progress?).to eq false }
      end

      context '横に移動する時' do
        let(:to_instruction) { { row_index: 2, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_progress?).to eq false }
      end

      context '斜め前に移動するとき' do
        let(:to_instruction) { { row_index: 1, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_progress?).to eq true }
      end

      context '斜め後ろに移動するとき' do
        let(:to_instruction) { { row_index: 3, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_progress?).to eq false }
      end

      context '停滞するとき' do
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.diagonally_progress?).to eq false }
      end
    end

    context '後手の場合' do
      let(:first_move) { false }
      let(:from_instruction) { { row_index: 1, column_index: 1 } }

      context '前進または後退するとき' do
        let(:to_instruction) { { row_index: [0, 2], column_index: 1 } }

        it { expect(move_direction.diagonally_progress?).to eq false }
      end

      context '横に移動する時' do
        let(:to_instruction) { { row_index: 1, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_progress?).to eq false }
      end

      context '斜め前に移動するとき' do
        let(:to_instruction) { { row_index: 2, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_progress?).to eq true }
      end

      context '斜め後ろに移動するとき' do
        let(:to_instruction) { { row_index: 0, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_progress?).to eq false }
      end

      context '停滞するとき' do
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.diagonally_progress?).to eq false }
      end
    end
  end

  describe '#diagonally_retreat?' do
    context '先手の場合' do
      let(:first_move) { true }
      let(:from_instruction) { { row_index: 1, column_index: 1 } }

      context '前進または後退するとき' do
        let(:to_instruction) { { row_index: [0, 2].sample, column_index: 1 } }

        it { expect(move_direction.diagonally_retreat?).to eq false }
      end

      context '横に移動する時' do
        let(:to_instruction) { { row_index: 1, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_retreat?).to eq false }
      end

      context '斜め前に移動するとき' do
        let(:to_instruction) { { row_index: 0, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_retreat?).to eq false }
      end

      context '斜め後ろに移動するとき' do
        let(:to_instruction) { { row_index: 2, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_retreat?).to eq true }
      end

      context '停滞するとき' do
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.diagonally_retreat?).to eq false }
      end
    end

    context '後手の場合' do
      let(:first_move) { false }
      let(:from_instruction) { { row_index: 2, column_index: 1 } }

      context '前進または後退するとき' do
        let(:to_instruction) { { row_index: [1, 3].sample, column_index: 1 } }

        it { expect(move_direction.diagonally_retreat?).to eq false }
      end

      context '横に移動する時' do
        let(:to_instruction) { { row_index: 2, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_retreat?).to eq false }
      end


      context '斜め前に移動するとき' do
        let(:to_instruction) { { row_index: 3, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_retreat?).to eq false }
      end

      context '斜め後ろに移動するとき' do
        let(:to_instruction) { { row_index: 1, column_index: [0, 2].sample } }

        it { expect(move_direction.diagonally_retreat?).to eq true }
      end

      context '停滞するとき' do
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.diagonally_retreat?).to eq false }
      end
    end
  end
end
