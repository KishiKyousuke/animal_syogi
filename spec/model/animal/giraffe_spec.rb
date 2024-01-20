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

  describe '#movable?' do
  end
end
