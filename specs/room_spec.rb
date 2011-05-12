require File.join(File.dirname(__FILE__), '..', 'room')
require File.join(File.dirname(__FILE__), '..', 'item')

describe Room do
	it "should have a description" do
		r = Room.new
		r.description.should be_nil
		r.description = "My room"
		r.description.should == "My room" 
	end

	it "should have adjoining rooms" do
		r = Room.new
		r.description = "A room."
		nr = Room.new
		nr.description = "north room"
	  r.rooms = {:north => nr}
		r.has_room_to_the?(:north).should be_true
	end

	it "should have items" do
		r = Room.new
		i = Item.new
		r.items = [i]
		r.should_not be_nil
	end
end
