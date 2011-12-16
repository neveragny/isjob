require 'factory_girl'
FactoryGirl.define do

  factory :user do
    name 'Test User'
    email 'user@test.com'
    password 'please'
  end

  factory :position do
    title 'Good CV'
    description 'some description'
    level 1
  end


end




