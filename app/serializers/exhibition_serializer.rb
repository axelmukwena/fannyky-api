class ExhibitionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :slug, :title, :description, :link,
             :location, :created_at, :when, :start_date,
             :end_date, :pagelink, :type, :organization, :painter,
             :user, :images

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
end
