class Avatar	
	attr_reader :location

	def initialize(starting_location)
		@location = starting_location
	end

	def can_move?(direction)
		@location.has_room_to_the?(direction)
	end

	def move(direction)
		if can_move?(direction)
			new_location = @location.rooms[direction]
			@location = new_location
			true
		else
			false
		end
	end
end
