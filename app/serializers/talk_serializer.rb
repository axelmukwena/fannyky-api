class TalkSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :date,
             :organizer, :location, :link, :images_count,
             :created_at, :slug, :painter, :user, :images

  def images
    return unless object.images.attachments
    object.images.map do |image|
      URI.join(ActiveStorage::Current.host,
               rails_blob_path(image, only_path: true))
    end
  end

  has_one :painter
  has_one :user
end
