FactoryBot.define do
  factory :message do
    comment { Faker::Lorem.sentence }
    association :store
    association :room
  end
end
