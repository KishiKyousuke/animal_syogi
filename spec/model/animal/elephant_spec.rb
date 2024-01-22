RSpec.describe Animal::Elephant do
  describe '#shortened_name' do
    let!(:elephant) { Animal::Elephant.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(elephant.shortened_name).to eq 'E' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(elephant.shortened_name).to eq 'e' }
    end
  end

  describe '#initial_position' do
    let!(:elephant) { Animal::Elephant.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(elephant.initial_position).to eq 'A4' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(elephant.initial_position).to eq 'C1' }
    end
  end

  describe '#validate_movable_range' do
    let!(:elephant) { Animal::Elephant.new(possession_player: possession_player) }
    let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }
    let(:from_instruction) { MoveInstructionParser.new('B3E').parse }
    let(:movable_position) { "#{%w(A2 A4 C2 C4).sample}E" }
    let(:unmovable_position) { "#{%w(A3 B2 B4 C3).sample}E"  }

    context '移動可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(movable_position).parse }

      it { expect(elephant.validate_movable_range(from_instruction, to_instruction)).to be_nil }
    end

    context '移動不可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(unmovable_position).parse }

      it { expect { elephant.validate_movable_range(from_instruction, to_instruction) }.to raise_error InvalidAnimalMovableRangeError }
    end
  end
end
