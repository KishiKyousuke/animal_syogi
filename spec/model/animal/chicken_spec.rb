require_relative '../../../player'
require_relative '../../../animal'
require_relative '../../../animal/chicken'

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

  describe '#movable?' do
  end
end
