# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    trait :onesup do
      email "onesup.lee@gmail.com"
      uid "10000"
    end
    trait :yang do
      email "shyang@mini.kr"
      uid "20000"
    end
  end
end
