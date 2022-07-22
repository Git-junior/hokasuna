class Room < ApplicationRecord
  has_many :consultation
  has_many :stores, through: :consultation
  has_many :messages

  validates :name, presence: true
end
