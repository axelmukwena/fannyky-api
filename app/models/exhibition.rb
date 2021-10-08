class Exhibition < ApplicationRecord
  belongs_to :painter
  belongs_to :user
  has_many :images, :as => :imageable
  paginates_per 50

  extend FriendlyId
  friendly_id :title, use: :slugged
end
