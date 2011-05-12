require File.join(File.dirname(__FILE__), "item")

describe Item do
	it "should have a description" do
		i = Item.new
		i.description = "bla"
		i.description.should == "bla"
	end
end
