RSpec.describe Animal::Lion do
  describe '#shortened_name' do
    let!(:lion) { Animal::Lion.new(possession_player: possession_player) }

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
    let!(:lion) { Animal::Lion.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(lion.initial_position).to eq 'B4' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(lion.initial_position).to eq 'B1' }
    end
  end

  describe '#movable?' do
  end
end
