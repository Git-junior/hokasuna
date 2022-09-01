FactoryBot.define do
  factory :message do
    business { '【依頼】譲って！！' }
    association :store
    association :room
  end
end
