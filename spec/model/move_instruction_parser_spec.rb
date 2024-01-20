RSpec.describe MoveInstructionParser do
  describe '#parse' do
    it '与えられた指示を解析してhashを返すこと' do
      # 先手の初期配置の指定
      expect(MoveInstructionParser.new('A4E').parse).to eq({ column_key: :A, row_index: 3, animal_class: Animal::Elephant })
      expect(MoveInstructionParser.new('B4L').parse).to eq({ column_key: :B, row_index: 3, animal_class: Animal::Lion })
      expect(MoveInstructionParser.new('C4G').parse).to eq({ column_key: :C, row_index: 3, animal_class: Animal::Giraffe })
      expect(MoveInstructionParser.new('B3C').parse).to eq({ column_key: :B, row_index: 2, animal_class: Animal::Chick })

      # 後手の初期配置の指定
      expect(MoveInstructionParser.new('A1G').parse).to eq({ column_key: :A, row_index: 0, animal_class: Animal::Giraffe })
      expect(MoveInstructionParser.new('B1L').parse).to eq({ column_key: :B, row_index: 0, animal_class: Animal::Lion })
      expect(MoveInstructionParser.new('C1E').parse).to eq({ column_key: :C, row_index: 0, animal_class: Animal::Elephant })
      expect(MoveInstructionParser.new('B2C').parse).to eq({ column_key: :B, row_index: 1, animal_class: Animal::Chick })
    end
  end
end
