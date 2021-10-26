class Painting < ApplicationRecord
  belongs_to :user
  belongs_to :painter
  belongs_to :category
  has_many_attached :images
  paginates_per 15

  extend FriendlyId
  friendly_id :title, use: :slugged
end
