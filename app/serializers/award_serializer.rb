class AwardSerializer < ActiveModel::Serializer
  attributes :id, :prize, :description, :year,
             :slug, :created_at, :pagelink,
             :painter, :user, :images

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

  has_one :painter
  has_one :user
end
