class TalkSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date,
             :organizer, :location, :link, :images_count,
             :created_at, :slug, :painter, :user
  has_one :painter
  has_one :user
end
