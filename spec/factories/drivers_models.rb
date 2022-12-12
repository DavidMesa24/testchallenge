FactoryBot.define do
  factory :driver do
    first_name Faker::Lorem.sentence
    email { Faker::Internet.unique.email }
    current_latitude { 0.4155928 }
    current_longitude { -0.73641523 }
  end
end
