RSpec.describe Animal::Chicken do
  describe '#shortened_name' do
    let!(:chicken) { Animal::Chicken.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(chicken.shortened_name).to eq 'P' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(chicken.shortened_name).to eq 'p' }
    end
  end

  describe '#validate_movable_range' do
    let!(:chicken) { Animal::Chicken.new(possession_player: possession_player) }
    let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }
    let(:from_instruction) { MoveInstructionParser.new('B3P').parse }
    let(:movable_position) { "#{%w(A3 A2 B2 B4 C2 C3).sample}P" }
    let(:unmovable_position) { "#{%w(A4 C4).sample}P" }

    context '移動可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(movable_position).parse }

      it { expect(chicken.validate_movable_range(from_instruction, to_instruction)).to be_nil }
    end

    context '移動不可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(unmovable_position).parse }

      it { expect { chicken.validate_movable_range(from_instruction, to_instruction) }.to raise_error InvalidAnimalMovableRangeError }
    end
  end
end
