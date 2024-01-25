RSpec.describe Lion do
  describe '#shortened_name' do
    let!(:lion) { Lion.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(lion.shortened_name).to eq 'L' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(lion.shortened_name).to eq 'l' }
    end
  end

  describe '#initial_position' do
    let!(:lion) { Lion.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(lion.initial_position).to eq 'B4' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(lion.initial_position).to eq 'B1' }
    end
  end

  describe '#validate_movable_range' do
    let!(:lion) { Lion.new(possession_player: possession_player) }
    let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }
    let(:from_instruction) { MoveInstructionParser.new('B3L').parse }
    let(:movable_position) { "#{%w(A2 A3 A4 B2 B4 C2 C3 C4).sample}L" }
    let(:unmovable_position) { 'B1L'  }

    context '移動可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(movable_position).parse }

      it { expect(lion.validate_movable_range(from_instruction, to_instruction)).to be_nil }
    end

    context '移動不可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(unmovable_position).parse }

      it { expect { lion.validate_movable_range(from_instruction, to_instruction) }.to raise_error InvalidAnimalMovableRangeError }
    end
  end
end
