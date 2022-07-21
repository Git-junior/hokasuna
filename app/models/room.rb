class Room < ApplicationRecord
  has_many :consultation
  has_many :stores, through: :consultation

  validates :name, presence: true
end
