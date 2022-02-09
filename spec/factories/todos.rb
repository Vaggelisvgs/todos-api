FactoryBot.define do
    factory :todo do
    title { Faker::House.room  }
    created_by { Faker::Number.number(digits: 10) }
   end
end