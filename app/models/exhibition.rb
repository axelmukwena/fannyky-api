class Exhibition < ApplicationRecord
  belongs_to :user
  belongs_to :painter, counter_cache: :exhibitions_count
  has_many_attached :images
  paginates_per 50

  extend FriendlyId
  friendly_id :title, use: :slugged
end
