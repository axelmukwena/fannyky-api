class Talk < ApplicationRecord
  belongs_to :painter, counter_cache: :talks_count
  belongs_to :user
  has_many_attached :images
  paginates_per 50

  extend FriendlyId
  friendly_id :page_link, use: :slugged

  def should_generate_new_friendly_id?
    page_link_changed?
  end

  validates :page_link, presence: true, uniqueness: true
end
