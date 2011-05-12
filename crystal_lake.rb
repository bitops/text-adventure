require File.join(File.dirname(__FILE__), 'avatar')
require File.join(File.dirname(__FILE__), 'room')
require File.join(File.dirname(__FILE__), 'input_controller')

lake = Room.new
lake.description = "You are standing by a beautiful lake."
lake.info = "You see a trail leading north into the forest."

forest = Room.new
forest.description = "You are in a forest, surrounded by lush trees."
forest.info = "Your house is to the west."

house = Room.new
house.description = "You're by your house! Home, sweet home."
house.info = "It's your house. You love this place. Back to the east is the forest."

lake.rooms = {:north => forest}
forest.rooms = {:south => lake, :west => house}
house.rooms = {:east => forest}

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

repl(ctl)
	
