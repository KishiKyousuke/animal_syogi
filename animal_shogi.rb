Dir["./lib/**/*.rb"].each { |file| require_relative file }

game = Game.new
game.start
