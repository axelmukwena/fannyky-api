require 'benchmark'
include Rails.application.routes.url_helpers

class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :slug, :rankdate, :title, :abstract,
             :dimension, :description, :created_at, :category,
             :images, :date_created, :pagelink, :painter, :user

  # https://stackoverflow.com/a/50481652/8050183
  # Check application controller :active_storage_current_host
  def images
    return unless object.images.attachments
    object.images.map do |image|
      original = URI.join(ActiveStorage::Current.host, rails_blob_path(image, only_path: true))
      # large2x = image_url(image, 1920, 1920, 100)
      large = image_url(image, 1080, 1080, 100)
      medium = image_url(image, 500, 500, 100)
      small = image_url(image, 200, 200, 100)

      { content: image.as_json,
        original: original,
        large: large,
        medium: medium,
        small: small
      }
    end
  end

  def image_url(image, w, h, quality)
    URI.join(ActiveStorage::Current.host,
             rails_representation_path(image.variant(resize_to_limit: [w, h],
                                                     quality: quality), only_path: true))
  end

  belongs_to :user
  belongs_to :painter
  has_many :images
  # belongs_to :category
end
