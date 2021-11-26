class Painting < ApplicationRecord
  belongs_to :user
  belongs_to :painter, counter_cache: :paintings_count
  # belongs_to :category
  has_many_attached :images
  paginates_per 20

  extend FriendlyId
  friendly_id :pagelink, use: :slugged

  def should_generate_new_friendly_id?
    pagelink_changed?
  end

  validates :pagelink, presence: true, uniqueness: true
end
