require 'minitest/autorun'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'room')

class RoomTest < MiniTest::Unit::TestCase
  
  def setup
		@room = Room.new
		@room.description = "A room."
		@room.rooms = []
		@room.items = []
		@room.info = "Info about the room."
		@room.handle = "Test room"    
  end
  
	def test_room_has_properties
		assert_equal("A room.", @room.description)
		assert_equal([], @room.rooms)
		assert_equal([], @room.items)
		assert_equal("Info about the room.", @room.info)
		assert_equal("Test room", @room.handle)
	end
	
	def test_room_knows_if_it_is_starting_location
	 @room.starting_location = false
	 refute(@room.starting_location?)
	 @room.starting_location = true
	 assert(@room.starting_location?)
	end
	
	def test_rooms_knows_adjacent_rooms
	  @room.rooms = {
	    "north" => "room_a",
	    "south" => "room_b"
	  }
	  assert(@room.has_room_to_the?("north"))
	  assert(@room.has_room_to_the?("south"))
	  refute(@room.has_room_to_the?("west"))
	  refute(@room.has_room_to_the?("east"))
	end
	
end








