class Avatar	
	
	def location
	  @current_room
	end

	def initialize(starting_location)
		@current_room = starting_location
	end

	def can_move?(direction)
		@current_room.has_room_to_the?(direction)
	end

	def move(direction)
		if can_move?(direction)
			new_room = @current_room.rooms[direction]
			@current_room = new_room
			true
		else
			false
		end
	end
end
