class ExhibitionSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :description, :link,
             :location, :created_at, :start_date, :end_date,
             :pagelink, :which, :organization, :painter, :rankdate,
             :user, :images

  def images
    return unless object.images.attachments
    object.images.map do |image|
      { content: image.as_json,
        original: image.key,
        large: image.variant(resize_to_limit: [1080, 1080], quality: 100).key,
        medium: image.variant(resize_to_limit: [500, 500], quality: 100).key,
        small: image.variant(resize_to_limit: [200, 200], quality: 100).key
      }
    end
  end

  belongs_to :user
  belongs_to :painter
end
