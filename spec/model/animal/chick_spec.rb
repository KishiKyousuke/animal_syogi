RSpec.describe Chick do
  describe '#shortened_name' do
    let!(:chick) { Chick.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(chick.shortened_name).to eq 'C' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(chick.shortened_name).to eq 'c' }
    end
  end

  describe '#initial_position' do
    let!(:chick) { Chick.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(chick.initial_position).to eq 'B3' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(chick.initial_position).to eq 'B2' }
    end
  end

  describe '#validate_movable_range' do
    let!(:chick) { Chick.new(possession_player: possession_player) }
    let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }
    let(:from_instruction) { MoveInstructionParser.new('B3C').parse }
    let(:movable_position) { 'B2C' }
    let(:unmovable_position) { "#{%w(A2 A3 A4 B4 C2 C3 C4).sample}C" }

    context '移動可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(movable_position).parse }

      it { expect(chick.validate_movable_range(from_instruction, to_instruction)).to be_nil }
    end

    context '移動不可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(unmovable_position).parse }

      it { expect { chick.validate_movable_range(from_instruction, to_instruction) }.to raise_error InvalidAnimalMovableRangeError }
    end
  end

  describe '#grow_up' do
  end
end
