require File.join(File.dirname(__FILE__), 'room')
require 'yaml'

class GameDataLoader

	def load_location_data(file)
		data = load_data_from(file)
		rooms = load_initial_state(data)
		establish_relationships(rooms)
		rooms
  end

	def load_message_data(file)
		load_data_from(file)
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
		room = get_room
		room.handle = room_data["handle"] 
		room.description = room_data["desc"]
		room.info = room_data["info"]
		room.rooms = room_data["rooms"]
		room.starting_location = room_data["starting_location"]
		room
	end
	
	private
	def get_room
    Room.new
	end
	
	def load_data_from(file)
	  YAML.load_file(file)
	end

end
