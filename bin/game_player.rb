GAME_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))

require File.join(GAME_ROOT, 'lib', 'bootstrap')
require File.join(GAME_ROOT, 'lib', 'game')

# TODO: this could be a little nicer.
location_data_file = File.absolute_path(File.join(GAME_ROOT, "#{ARGV[0]}"))
message_data_file = File.absolute_path(File.join(GAME_ROOT, "#{ARGV[1]}"))

# main
bootstrap = Bootstrap.new(location_data_file, message_data_file)
game = Game.new(bootstrap)
game.play