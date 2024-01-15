require_relative 'animal'
require_relative 'animal/lion'
require_relative 'animal/elephant'
require_relative 'animal/giraffe'
require_relative 'animal/chick'
require_relative 'animal/chicken'
require_relative 'move_instruction_parser'
require_relative 'player'
require_relative 'diagram'
require_relative 'board'
require_relative 'game'

game = Game.new
game.start
