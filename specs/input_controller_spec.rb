require File.join(File.dirname(__FILE__), '..', 'input_controller')

describe InputController do
	it "should determine if input is valid" do
		input_controller = InputController.new
		input_controller.valid?("exit").should be_true
		input_controller.valid?("go west").should be_true
		input_controller.valid?("go west now").should be_false
		input_controller.valid?("bork").should be_false
	end

	it "should take input and do things accordingly" do
		input_controller = InputController.new
		mock_avatar = mock("Avatar")
		input_controller.avatar = mock_avatar
		mock_avatar.should_receive(:can_move?).with(:west).and_return(true)
		mock_avatar.should_receive(:move).with(:west)
		input_controller.evaluate("go west")
	end

	it "should have a current message for the view" do
		input_controller = InputController.new
		mock_avatar = mock("Avatar")
		input_controller.avatar = mock_avatar
		mock_avatar.should_receive(:location).and_return(mock_avatar)
		mock_avatar.should_receive(:description).and_return("Welcome, avatar!")
		input_controller.initialize_message
		input_controller.current_message.should == "Welcome, avatar!"
	end

	it "should bail if bad input" do
		ctl = InputController.new
		ctl.evaluate("some bad input")
		ctl.current_message.should == "Sorry, that is not a valid command."
	end
end
