class PainterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :slug, :rank, :name, :about, :email, :phone,
             :link, :created_at, :paintings_count, :publications_count,
             :exhibitions_count, :talks_count, :pagelink,
             :awards_count, :user, :paintings_categories, :images

  def images
    return unless object.images.attachments
    object.images.map do |image|
      url = URI.join(ActiveStorage::Current.host,
                     rails_blob_path(image, only_path: true))
      { content: image.as_json, url: url }
    end
  end

  belongs_to :user
end
