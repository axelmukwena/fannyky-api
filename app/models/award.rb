class Award < ApplicationRecord
  belongs_to :painter, counter_cache: :awards_count
  belongs_to :user
  has_many_attached :images
  paginates_per 60

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  validates :title, presence: true, uniqueness: true
end
