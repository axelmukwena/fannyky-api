class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :abstract, :dimension, :description,
             :created_at, :images_count, :date_created, :category, :explorer,
             :painter, :user

  belongs_to :user
  belongs_to :painter
  belongs_to :category
end
