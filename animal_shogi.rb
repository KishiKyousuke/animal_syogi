Dir[File.join(__dir__, 'lib', '**', '*.rb')].each { |file| require file }

game = Game.new
game.start
