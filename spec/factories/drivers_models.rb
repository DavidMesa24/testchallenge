FactoryBot.define do
  factory :driver do
    first_name Faker::Lorem.sentence
    email { Faker::Internet.unique.email }
  end
end