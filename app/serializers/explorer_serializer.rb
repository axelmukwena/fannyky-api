class ExplorerSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :description, :created_at,
             :images_count, :date_created, :category, :explorer


end