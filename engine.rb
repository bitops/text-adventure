require File.join(File.dirname(__FILE__), 'avatar')
require File.join(File.dirname(__FILE__), 'room')
require File.join(File.dirname(__FILE__), 'input_controller')
require File.join(File.dirname(__FILE__), 'game_data_loader')

location_data_file = File.absolute_path(File.join(File.dirname(__FILE__), "#{ARGV[0]}"))

ARGV.clear

loader = GameDataLoader.new
locations = loader.load_location_data(location_data_file)
lake = locations.find {|location| location.handle == "lake"} 

# Initializing controller
a = Avatar.new(lake)
ctl = InputController.new
ctl.avatar = a
ctl.initialize_message

def repl(ctl)
	puts ctl.current_message
	puts 
	print "> "
	input = gets.chomp
	ctl.evaluate(input)
	repl(ctl)
end

def print_welcome
	puts <<WELCOME
Welcome to Crystal Lake! Have fun and explore. (Type "help" if you get stuck).
WELCOME
end

# One off stuff before the game starts
print_welcome
# Set up the game loop
repl(ctl)
	
