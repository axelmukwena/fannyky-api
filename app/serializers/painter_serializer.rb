class PainterSerializer < ActiveModel::Serializer
  attributes :id, :slug, :name, :about, :email, :phone,
             :facebook, :instagram, :twitter, :created_at,
             :images_count, :paintings_count, :exhibitions_count,
             :books_count, :talks_count, :user

  belongs_to :user
end
