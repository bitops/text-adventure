class InputController
	attr_reader :avatar, :current_message
	
	def avatar=(avatar)
		@avatar = avatar
	end

	def initialize_message
		@current_message = avatar.location.description
	end

	def evaluate(input)
		tokens = input.split.map(&:to_sym)
		unless valid?(input)
			@current_message = "Sorry, that is not a valid command."
			return
		end		

		if tokens.first == :go
			if avatar.can_move?(tokens.last)
				avatar.move(tokens.last)
			else
			end
		end	
	end

	def valid?(input)
		tokens = input.split
		result = false
		if tokens.first == "exit" && tokens.size == 1
			result = true
		elsif tokens.size == 2
			result = true
		end
		result
	end
end
