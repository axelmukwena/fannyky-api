class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :published_year,
             :link, :images_count, :slug, :created_at,
             :explorer, :user, :painter

  belongs_to :user
  belongs_to :painter
end
