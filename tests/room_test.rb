require 'minitest/autorun'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'room')

class TestUrlValidator < MiniTest::Unit::TestCase
  
	def test_room_has_properties
		@room = Room.new
		@room.description = "A room."
		@room.rooms = []
		@room.items = []
		@room.info = "Info about the room."
		@room.handle = "Test room"
		
		assert_equal("A room.", @room.description)
		assert_equal([], @room.rooms)
		assert_equal([], @room.items)
		assert_equal("Info about the room.", @room.info)
		assert_equal("Test room", @room.handle)
	end
	
	def test_rooms_knows_adjacent_rooms
	  raise "not yet"
	end
	
	# TODO: starting location
	
end
