# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift do
    name "coffee"
    quantity 4
    started_at Time.now
    finished_at Time.now + 1.day
  end
end
