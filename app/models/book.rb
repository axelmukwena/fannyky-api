class Book < ApplicationRecord
  belongs_to :painter, counter_cache: :books_count
  belongs_to :user
  has_many_attached :images
  paginates_per 50

  extend FriendlyId
  friendly_id :title, use: :slugged
end
