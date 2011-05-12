require File.join(File.dirname(__FILE__), 'avatar')
require File.join(File.dirname(__FILE__), 'room')

lake = Room.new
lake.description = "You are standing by a beautiful lake."

forest = Room.new
forest.description = "You are in a forest, surrounded by lush trees."

house = Room.new
house.description = "You're by your house! Home, sweet home."

lake.rooms = {:north => forest}
forest.rooms = {:south => lake, :west => house}
house.rooms = {:east => forest}

a = Avatar.new(lake)

def repl(avatar)
	puts avatar.location.description
	puts 
	print "> "
	input = gets.chomp.to_sym
	if avatar.can_move?(input)
		avatar.move(input)
	else
		puts "Sorry, can't go #{input} from here."
	end
	repl(avatar)
end

repl(a)
	
