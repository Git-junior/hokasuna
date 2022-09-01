class Message < ApplicationRecord
  belongs_to :store
  belongs_to :room

  validates :business, presence: true
end
