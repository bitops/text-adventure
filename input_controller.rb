class InputController
	attr_reader :avatar, :current_message
	
	def avatar=(avatar)
		@avatar = avatar
	end

	def messages=(messages)
		@messages = messages
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
			direction = tokens.last
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
			@current_message = @messages["help"]
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

end
