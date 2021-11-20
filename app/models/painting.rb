class Painting < ApplicationRecord
  belongs_to :user
  belongs_to :painter, counter_cache: :paintings_count
  belongs_to :category
  has_many_attached :images
  paginates_per 20

  extend FriendlyId
  friendly_id :title, use: :slugged
end
