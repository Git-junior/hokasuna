class Room < ApplicationRecord
  has_many :consultation, dependent: :destroy
  has_many :stores, through: :consultation
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
