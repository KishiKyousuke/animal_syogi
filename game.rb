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
    binding.irb
  end

  private

  def prepare_board
    [sente, gote].each do |player|
      player.animals_in_hand.each do |animal|
        initial_position_instruction = "#{animal.initial_position}#{animal.shortened_name}"
        player.move_animal(board: board, from: nil, to: initial_position_instruction)
      end
    end
  end

  def sharing_animals
    INITIAL_ANIMALS.each do |animal|
      sente.animals_in_hand << animal.new(possession_player: sente)
      gote.animals_in_hand << animal.new(possession_player: gote)
    end
  end
end
