class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :published_year,
             :link, :images_count, :slug, :date_created, :painter, :user

  belongs_to :user
  belongs_to :painter
end
