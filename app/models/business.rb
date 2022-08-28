class Business < ActiveHash::Base
  self.data = [
    { id: 1, name: '▼ 御用件を選択 ▼' },
    { id: 2, name: '【依頼】譲って！！' },
    { id: 3, name: '【依頼】貰って！！' },
    { id: 4, name: '【返答】' }
  ]

  include ActiveHash::Associations
  has_many :messages
end