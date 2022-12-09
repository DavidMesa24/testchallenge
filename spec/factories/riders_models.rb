FactoryBot.define do
  factory :rider do
    first_name Faker::Lorem.sentence
    email { Faker::Internet.unique.email }
    status 'ACTIVE'
  end
end