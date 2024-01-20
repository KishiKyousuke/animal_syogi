RSpec.describe MoveDirection do
  let(:player) { Player.new(animals_in_hand: [], first_move:) }
  let(:move_direction) { MoveDirection.new(from_instruction, to_instruction, player) }

  describe '#advance_straight_ahead?' do
    context '先手の場合' do
      let(:first_move) { true }

      context '前進するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq true }
      end

      context '後退するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 3, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '横に移動する時' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 2 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '斜め前に移動するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 2 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '停滞するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end
    end

    context '後手の場合' do
      let(:first_move) { false }

      context '前進するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq true }
      end

      context '後退するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 0, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '横に移動する時' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 2 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '斜め前に移動するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 2, column_index: 2 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end

      context '停滞するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.advance_straight_ahead?).to eq false }
      end
    end
  end

  describe '#retreat_straight_back?' do
    context '先手の場合' do
      let(:first_move) { true }

      context '前進するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '後退するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 3, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq true }
      end

      context '横に移動する時' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 2 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '斜め後ろに移動するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 2 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '停滞するとき' do
        let(:from_instruction) { { row_index: 2, column_index: 1 } }
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end
    end

    context '後手の場合' do
      let(:first_move) { false }

      context '前進するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 2, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '後退するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 0, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq true }
      end

      context '横に移動する時' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 2, column_index: 2 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '斜め後ろに移動するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 2, column_index: 2 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end

      context '停滞するとき' do
        let(:from_instruction) { { row_index: 1, column_index: 1 } }
        let(:to_instruction) { { row_index: 1, column_index: 1 } }

        it { expect(move_direction.retreat_straight_back?).to eq false }
      end
    end
  end

  describe '#sidestep?' do
    let(:first_move) { [true, false].sample }

    context '横に移動するとき' do
    end
  end

  describe '#diagonally_progress?' do
  end

  describe '#diagonally_retreat?' do
  end
end
