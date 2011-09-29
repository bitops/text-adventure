require 'readline'
require File.join(File.dirname(__FILE__), '..', 'lib', 'avatar')
require File.join(File.dirname(__FILE__), '..', 'lib', 'room')
require File.join(File.dirname(__FILE__), '..', 'lib', 'input_controller')
require File.join(File.dirname(__FILE__), '..', 'lib', 'game_data_loader')

location_data_file = File.absolute_path(File.join(File.dirname(__FILE__), '..', "#{ARGV[0]}"))
message_data_file = File.absolute_path(File.join(File.dirname(__FILE__), '..', "#{ARGV[1]}"))

ARGV.clear

loader = GameDataLoader.new
locations = loader.load_location_data(location_data_file)
messages = loader.load_message_data(message_data_file)
starting_location = locations.find {|location| location.starting_location?} 

# Initializing controller
avatar = Avatar.new(starting_location)
ctl = InputController.new
ctl.messages = messages
ctl.avatar = avatar
ctl.initialize_message

def repl(ctl)
	puts ctl.current_message
	puts 
	input = Readline.readline('> ', true)
	ctl.evaluate(input)
	repl(ctl)
end

# Print splash
puts messages["splash"]
# Set up the game loop
repl(ctl)
	
