class ExhibitionsSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :description, :link, :location,
             :created_at, :images_count, :date_created, :when,
             :start_date, :end_date, :user, :painter

  belongs_to :user
  belongs_to :painter
end
