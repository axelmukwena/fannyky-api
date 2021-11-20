class ExhibitionSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :description, :link, :location,
             :created_at, :images_count, :when, :start_date, :end_date,
             :type, :painter, :user

  belongs_to :user
  belongs_to :painter
end
