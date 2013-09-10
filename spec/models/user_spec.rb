require 'spec_helper'


describe User do
	it "has a valid factory" do 
   expect(FactoryGirl.build(:user)).to be_valid
	end
  
	it "is invalid without a name" do 
		expect(build(:user, name: nil)).to have(1).errors_on(:name)
	end

	it "is invalid without an email" do
		expect(build(:user, email: nil)).to have(2).errors_on(:email)
	end

	it "is invalid without a date staffed date" do 
		expect(build(:user, joined_staff: nil)).to have(1).errors_on(:joined_staff)
	end

	it "is invalid with a duplicate email address" do 
		user = FactoryGirl.build(:user, email: "hello@gmail.com")
		FactoryGirl.create(:user, email: "hello@gmail.com")
		expect(user).to have(1).errors_on(:email)
	end

	

end
