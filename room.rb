class Room
	attr_accessor :description, :rooms, :items, :info, :handle

	def has_room_to_the?(direction)
		rooms.key?(direction)
	end
end
