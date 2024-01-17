class Game
  def initialize
    @sente = Player.new(animals_in_hand: [], first_move: true)
    @gote = Player.new(animals_in_hand: [], first_move: false)
    @board = Board.new(placed_animals: [])
  end

  attr_reader :sente, :gote, :board

  INITIAL_ANIMALS = [Animal::Lion, Animal::Chick, Animal::Elephant, Animal::Giraffe]

  def start
    sharing_animals
    prepare_board
    puts '先手：入力してください'
    show_diagram_and_hands
    sente_input = gets
    from, to = InputParser.new(sente_input).parse
    sente.move_animal(board: board, from: from, to: to)
    puts '後手：入力してください'
    show_diagram_and_hands
    gote_input = gets
  end

  private

  def prepare_board
    [sente, gote].each do |player|
      # player.animals_in_handをそのまま使うと、3度目のループでsize < iとなり終了してしまうため、配列をコピーする
      initial_animals_in_hand = player.animals_in_hand.dup
      initial_animals_in_hand.each do |animal|
        initial_position_instruction = "#{animal.initial_position}#{animal.shortened_name}"
        player.move_animal(board: board, from: nil, to: initial_position_instruction)
      end
    end
  end

  def sharing_animals
    INITIAL_ANIMALS.each do |animal_class|
      sente.animals_in_hand << animal_class.new(possession_player: sente)
      gote.animals_in_hand << animal_class.new(possession_player: gote)
    end
  end

  def show_diagram_and_hands
    puts "後手：#{gote.show_hands}"
    board.show_diagram
    puts "先手：#{sente.show_hands}"
  end
end
