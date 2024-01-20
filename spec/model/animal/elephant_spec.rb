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

  describe '#movable?' do
  end
end
