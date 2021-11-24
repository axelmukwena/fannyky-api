class PainterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :slug, :name, :about, :email, :phone,
             :facebook, :instagram, :twitter, :created_at,
             :images_count, :paintings_count, :publications_count,
             :exhibitions_count, :talks_count, :awards_count,
             :user, :images

  def images
    return unless object.images.attachments
    object.images.map do |image|
      URI.join(ActiveStorage::Current.host,
               rails_blob_path(image, only_path: true))
    end
  end

  belongs_to :user
end
