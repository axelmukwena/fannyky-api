class Painting < ApplicationRecord
  belongs_to :user
  belongs_to :painter
  has_many :images, :as => :imageable
  paginates_per 15

  extend FriendlyId
  friendly_id :title, use: :slugged
end
