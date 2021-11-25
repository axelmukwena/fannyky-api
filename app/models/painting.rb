class Painting < ApplicationRecord
  belongs_to :user
  belongs_to :painter, counter_cache: :paintings_count
  # belongs_to :category
  has_many_attached :images
  paginates_per 20

  extend FriendlyId
  friendly_id :title, use: :slugged

  # https://stackoverflow.com/a/38449957/8050183
  def should_generate_new_friendly_id?
    title_changed?
  end

  validates :title, presence: true, uniqueness: true
end
