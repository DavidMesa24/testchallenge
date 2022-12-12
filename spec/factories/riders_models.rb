FactoryBot.define do
  factory :rider do
    id { 1 }
    first_name Faker::Lorem.sentence
    email { Faker::Internet.unique.email }
    status 'ACTIVE'
  end
end