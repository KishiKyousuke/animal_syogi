RSpec.describe InputParser do
  describe '#parse' do
    let(:input_parser) { InputParser.new(input) }

    context 'コンマ区切りで入力された場合' do
      context '適切な形式の入力の場合' do
        let(:input) { 'A1G,A2G' }

        it { expect(input_parser.parse).to eq %w[A1G A2G] }
      end

      context '入力された英数字が不正な場合' do
        let(:input) { 'A1G,D2G' }

        it { expect { input_parser.parse }.to raise_error InvalidInputError }
      end

      context '入力された動物の頭文字が異なる場合' do
        let(:input) { 'A1G,A2C' }

        it { expect { input_parser.parse }.to raise_error InvalidInputError }
      end
    end

    context 'コンマ区切りがない場合' do
      context '適切な形式の入力の場合' do
        let(:input) { 'A1G' }

        it { expect(input_parser.parse).to eq [nil, 'A1G'] }
      end

      context '入力された英数字が不正な場合' do
        let(:input) { 'A5G' }

        it { expect { input_parser.parse }.to raise_error InvalidInputError }
      end
    end
  end
end
