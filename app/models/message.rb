class Message < ApplicationRecord
  belongs_to :store
  belongs_to :room

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :business

  validates :business_id, numericality: { other_than: 1, message: "can't be blank" }
end
