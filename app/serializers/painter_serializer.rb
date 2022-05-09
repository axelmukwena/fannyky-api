class PainterSerializer < ActiveModel::Serializer
  attributes :id, :slug, :rank, :name, :about, :email, :phone,
             :link, :created_at, :paintings_count, :publications_count,
             :exhibitions_count, :talks_count, :pagelink, :menuitems,
             :awards_count, :user, :paintings_categories, :images

  def paintings_categories
    puts "------------------------"
    puts "------------------------"
    puts object.paintings_categories
    puts "------------------------"
    puts "------------------------"
    return unless object.paintings_categories.blank?
    JSON.parse(object.paintings_categories)
  end

  def images
    return unless object.images.attachments
    object.images.map do |image|
      { content: image.as_json,
        original: image.key,
        large: image.variant(resize_to_limit: [1080, 1080], quality: 100).key,
        medium: image.variant(resize_to_limit: [500, 500], quality: 100).key,
        small: image.variant(resize_to_limit: [200, 200], quality: 100).key
      }
    end
  end

  belongs_to :user
end
