class PublicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :year,
             :organization, :location, :images_count,
             :slug, :created_at, :painter, :user
  has_one :painter
  has_one :user
end
