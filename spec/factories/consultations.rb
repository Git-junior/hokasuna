FactoryBot.define do
  factory :consultation do
    association :store
    association :room
  end
end
