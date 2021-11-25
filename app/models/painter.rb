class Painter < ApplicationRecord
  belongs_to :user
  has_many :paintings
  has_many :exhibitions
  has_many :talks
  has_many :awards
  has_many :publications
  has_many_attached :images
  paginates_per 50

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true
end
