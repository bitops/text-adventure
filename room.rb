class Room
	attr_accessor :description, :rooms, :items, :info, :handle
	attr_writer :starting_location

	def has_room_to_the?(direction)
		rooms.key?(direction)
	end

	def starting_location?
		@starting_location
	end
end
