class Message < ApplicationRecord
  belongs_to :store
  belongs_to :room

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :business
end
