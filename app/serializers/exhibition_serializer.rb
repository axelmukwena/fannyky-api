class ExhibitionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :slug, :title, :description, :link,
             :location, :created_at, :start_date, :end_date,
             :pagelink, :which, :organization, :painter, :rankdate,
             :user, :images

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
end
