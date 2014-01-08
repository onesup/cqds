# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift do
    name "coffee"
    quantity 500
    started_at Time.now
    finished_at Time.now + 60.day
  end
end
