class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :description, :created_at,
             :images_count, :date_created, :user, :painter

  belongs_to :user
  belongs_to :painter
end
