FactoryBot.define do
    # todo data for testing
    factory :todo do
    title { Faker::House.room  }
    created_by { Faker::Number.number(digits: 10) }
   end
end