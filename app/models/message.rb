class Message < ApplicationRecord
  validates :comment, presence: true

  belongs_to :store
  belongs_to :room
end
