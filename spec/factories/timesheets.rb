FactoryGirl.define do
	factory :timesheet do
		association :user
		conversation "1" 
		day "09/10/2013"
		study "1"
		teacher "1"
	end
end