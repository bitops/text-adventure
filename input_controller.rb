class InputController
	attr_reader :avatar, :current_message
	
	def avatar=(avatar)
		@avatar = avatar
	end

	def initialize_message
		@current_message = avatar.location.description
	end

	def evaluate(input)
		tokens = input.split
		unless valid?(input)
			@current_message = "Sorry, that is not a valid command."
			return
		end		

		command = tokens.first

		if command == "go"
			direction = tokens.last.to_sym
			if avatar.can_move?(direction)
				avatar.move(direction)
				@current_message = avatar.location.description
			else
				@current_message = "Sorry, you cannot go #{direction} from here."
			end
		end	

		if command == "look"
			@current_message = avatar.location.info
		end
		
		if command == "help"
			@current_message = help_message
		end

		if command == "exit" || command == "quit"
			puts "Thank you for playing!"
			exit(0)
		end
	end

	def valid?(input)
		tokens = input.split
		result = false
		if valid_commands.include?(tokens.first) && tokens.size == 1
			result = true
		elsif tokens.size == 2
			result = true
		end
		result
	end

	def valid_commands
		@commands ||= %w(look exit quit help)
	end

	def help_message
		help = <<HELP
Crystal Lake is a simple adventure.

You can say "look" to get more information about your surroundings.

You can say "go <direction>" to walk somewhere. You can go east, west, north, or south.

You can say "exit" or "quit" to exit the game.
HELP
	end
end
