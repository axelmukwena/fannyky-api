class PublicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :year,
             :organization, :location, :pagelink, :link, :rankdate,
             :slug, :created_at, :painter, :user, :images

  def images
    return unless object.images.attachments
    object.images.map do |image|
      url = URI.join(ActiveStorage::Current.host,
                     rails_blob_path(image, only_path: true))
      { content: image.as_json, url: url }
    end
  end

  has_one :painter
  has_one :user
end
