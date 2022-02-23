FactoryBot.define do
    # user data for testing
    factory :user do
      name { Faker::Name.name }
      email { 'foo@bar.com' }
      password { 'foobar' }
    end
  end