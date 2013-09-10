require 'spec_helper'


describe Timesheet do
	it "has a valid factory" do 
   expect(FactoryGirl.build(:timesheet)).to be_valid
	end
	

end
