class Painting < ApplicationRecord
  belongs_to :user
  belongs_to :painter, counter_cache: :paintings_count
  # belongs_to :category
  has_many_attached :images
  paginates_per 20

  extend FriendlyId
  friendly_id :page_link, use: :slugged

  # https://stackoverflow.com/a/38449957/8050183
  def should_generate_new_friendly_id?
    page_link_changed?
  end

  validates :page_link, presence: true, uniqueness: true
end
