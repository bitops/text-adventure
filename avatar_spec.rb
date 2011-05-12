require File.join(File.dirname(__FILE__), "avatar")

describe Avatar do
	it "should have a location, a room" do	
		room = Room.new
		a = Avatar.new room
		a.location.should_not be_nil
	end

	it "should know if it could around" do
		mock_room = mock("Room")
	  a = Avatar.new mock_room	
		mock_room.should_receive(:has_room_to_the?).and_return(true)
		a.can_move?(:north).should be_true
	end

	it "should not be able to move if illegal" do
		mock_room = mock("Room")
		a = Avatar.new mock_room
		mock_room.should_receive(:has_room_to_the?).with(:north).and_return(false)
		a.move(:north).should be_false
	end

	it "should be able to move if legal" do
		north = Room.new		
		north.description = "hooray"
		
		r = Room.new
		r.description = "initial"
		r.rooms = {:north => north}
	
		a = Avatar.new(r)
		a.move(:north).should be_true
		a.location.description.should == "hooray"
	end

end
