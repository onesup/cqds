# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wall_post do
    trait :today do
      created_at Time.now
      sequence :message do |n|
        "message #{n}"
      end
    end
    
    trait :yesterday do
      created_at Time.now - 1.days
      sequence :message do |n|
        "message #{n}"
      end
    end
    
  end
  
end