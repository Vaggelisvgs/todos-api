FactoryBot.define do
  factory :item do
    name { Faker::Hobby.activity}
    done { false }
    todo_id { nil } 
   end
end