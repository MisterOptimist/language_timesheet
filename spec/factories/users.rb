 FactoryGirl.define do 
		factory :user do		
		name "Casey"
		password "123456789"
 		joined_staff "2013/09/09"
 		sequence(:email) { |n| "okinomo#{n}@example.com"}
 	end
 end