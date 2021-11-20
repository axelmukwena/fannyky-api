class Talk < ApplicationRecord
  belongs_to :painter, counter_cache: :exhibitions_count
  belongs_to :user
  has_many_attached :images
  paginates_per 15

  extend FriendlyId
  friendly_id :title, use: :slugged
end
