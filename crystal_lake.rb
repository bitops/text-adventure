require File.join(File.dirname(__FILE__), 'avatar')
require File.join(File.dirname(__FILE__), 'room')
require File.join(File.dirname(__FILE__), 'input_controller')

print "Loading..."
# Loading - make it big to feel the pain of loading time.
lake = Room.new
lake.description = "You are standing by a beautiful lake."
lake.info = "You see a trail leading north into the forest."

forest = Room.new
forest.description = "You are in a forest, surrounded by lush trees."
forest.info = "Your house is to the west. The mountains are to the east."

house = Room.new
house.description = "You're by your house! Home, sweet home."
house.info = "It's your house. You love this place. Back to the east is the forest."

mountains = Room.new
mountains.description = "You've hiked up into the mountains. From here you can see the whole valley that you live in."
mountains.info = "The mountains are beautiful. Down the mountain and to the west is the forest."

# Wiring up relationships between rooms
lake.rooms = {:north => forest}
forest.rooms = {:south => lake, :west => house, :east => mountains}
mountains.rooms = {:west => forest}
house.rooms = {:east => forest}

puts "done."

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
	
