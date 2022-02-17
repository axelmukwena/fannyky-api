class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :slug, :rankdate, :title, :abstract,
             :dimension, :description, :created_at, :category,
             :images, :date_created, :pagelink, :painter, :user

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
  has_many :images
  # belongs_to :category
end
