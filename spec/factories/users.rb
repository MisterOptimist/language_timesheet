 FactoryGirl.define do 
		factory :user do		
		name { Faker::Name.name }
		password "0123456789"
 		joined_staff "2013/09/09"
 		sequence(:email) { |n| "okinomo#{n}@example.com"}

 		factory :admin do
        after(:create) {|user| user.add_role(:admin)}
        
    	end
 	end
 end