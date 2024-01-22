RSpec.describe Player do
  describe '#first_move?' do
    let!(:player) { Player.new(animals_in_hand: [], first_move: first_move) }

    context '先手の場合' do
      let(:first_move) { true }

      it { expect(player.first_move?).to eq true }
    end

    context '後手の場合' do
      let(:first_move) { false }

      it { expect(player.first_move?).to eq false }
    end
  end

  describe '#show_hands' do
    let!(:player) { Player.new(animals_in_hand: [], first_move: false) }
    let(:animals_in_hand) { [Animal::Chick.new(possession_player: player), Animal::Giraffe.new(possession_player: player)] }

    before do
      player.instance_variable_set(:@animals_in_hand, animals_in_hand)
    end

    it '手持ちの動物の省略名の文字列を返すこと' do
      expect(player.show_hands).to eq 'c, g'
    end
  end

  describe '#name' do
    let!(:player) { Player.new(animals_in_hand: [], first_move: first_move) }

    context '先手の場合' do
      let(:first_move) { true }

      it { expect(player.name).to eq '先手' }
    end

    context '後手の場合' do
      let(:first_move) { false }

      it { expect(player.name).to eq '後手' }
    end
  end

  describe '#move_animal' do
    context 'fromとtoが指定されている場合' do
    end

    context 'toだけが指定されている場合' do
    end
  end
end
