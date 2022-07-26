class Message < ApplicationRecord
  validates :comment, presence: true
  validates :quantity, format: { with: /\A\d{1,}\D+\z/ }

  belongs_to :store
  belongs_to :room
end
