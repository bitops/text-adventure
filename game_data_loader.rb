require File.join(File.dirname(__FILE__), 'room')
require 'yaml'

class GameDataLoader

	def load_data(file)
		data = YAML.load_file(file)
		rooms = load_initial_state(data)
		establish_relationships(rooms)
		rooms
  end

	def load_initial_state(data)
		rooms = []
		data.each {|room_data| rooms << build_room(room_data)}
		rooms
	end

	def establish_relationships(all_rooms)
		all_rooms.each do |room|
			room.rooms.each do |direction, handle|
				room.rooms[direction] = all_rooms.find {|r| r.handle == handle}
			end
		end	
	end

	def build_room(room_data)
		room = Room.new
		room.handle = room_data["handle"] 
		room.description = room_data["desc"]
		room.info = room_data["info"]
		room.rooms = room_data["rooms"]
		room
	end

end
