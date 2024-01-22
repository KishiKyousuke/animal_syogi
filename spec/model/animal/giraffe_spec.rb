RSpec.describe Animal::Giraffe do
  describe '#shortened_name' do
    let!(:giraffe) { Animal::Giraffe.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(giraffe.shortened_name).to eq 'G' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(giraffe.shortened_name).to eq 'g' }
    end
  end

  describe '#initial_position' do
    let!(:giraffe) { Animal::Giraffe.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(giraffe.initial_position).to eq 'C4' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(giraffe.initial_position).to eq 'A1' }
    end
  end

  describe '#validate_movable_range' do
    let!(:giraffe) { Animal::Giraffe.new(possession_player: possession_player) }
    let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }
    let(:from_instruction) { MoveInstructionParser.new('B3G').parse }
    let(:movable_position) { "#{%w(A3 B2 B4 C3).sample}G" }
    let(:unmovable_position) { "#{%w(A2 A4 C2 C4).sample}G"  }

    context '移動可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(movable_position).parse }

      it { expect(giraffe.validate_movable_range(from_instruction, to_instruction)).to be_nil }
    end

    context '移動不可能な場合' do
      let(:to_instruction) { MoveInstructionParser.new(unmovable_position).parse }

      it { expect { giraffe.validate_movable_range(from_instruction, to_instruction) }.to raise_error InvalidAnimalMovableRangeError }
    end
  end
end
