class PaintingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :slug, :rankdate, :title, :abstract,
             :dimension, :description, :created_at, :group_type,
             :images, :date_created, # :category,
             :pagelink, :painter, :user

  # https://stackoverflow.com/a/50481652/8050183
  # Check application controller :active_storage_current_host
  def images
    return unless object.images.attachments
    object.images.map do |image|
      url = URI.join(ActiveStorage::Current.host,
               rails_blob_path(image, only_path: true))
      { content: image.as_json, url: url }
    end
  end

  belongs_to :user
  belongs_to :painter
  has_many :images
  # belongs_to :category
end
