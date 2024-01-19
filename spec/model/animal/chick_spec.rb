require_relative '../../../player'
require_relative '../../../animal'
require_relative '../../../animal/chick'

RSpec.describe Animal::Chick do
  describe '#shortened_name' do
    let!(:chick) { Animal::Chick.new(possession_player: possession_player) }

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
    let!(:chick) { Animal::Chick.new(possession_player: possession_player) }

    context '先手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: true) }

      it { expect(chick.initial_position).to eq 'B3' }
    end

    context '後手の場合' do
      let(:possession_player) { Player.new(animals_in_hand: [], first_move: false) }

      it { expect(chick.initial_position).to eq 'B2' }
    end
  end

  describe '#movable?' do
  end

  describe '#grow_up' do
  end
end
