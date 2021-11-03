class ExplorerController < ApplicationController
  def index
    @exh = Exhibition.where.not(explorer: nil)
    @pts = Painting.where.not(explorer: nil)
    @bks = Book.where.not(explorer: nil)

    @exhibitions = []
    @exh.each { |e|
      item = { id: SecureRandom.uuid, true_id: e.id, type: "exhibition",
               created_at: e.created_at, description: e.description,
               end_date: e.end_date, explorer: e.explorer, images_count: e.images_count,
               link: e.link, location: e.location, painter: Painter.find_by(id: e.painter_id),
               slug: e.slug, start_date: e.start_date, title: e.title,
               user: User.find_by(id: e.user_id), when: e.when }
      @exhibitions.append(item)
    }

    @paintings = []
    @pts.each { |e|
      item = { id: SecureRandom.uuid, true_id: e.id, type: "painting", category: e.category,
               created_at: e.created_at, description: e.description, explorer: e.explorer,
               images_count: e.images_count, painter: Painter.find_by(id: e.painter_id),
               slug: e.slug, title: e.title, user: User.find_by(id: e.user_id) }
      @paintings.append(item)
    }

    @books = []
    @bks.each { |e|
      item = { id: SecureRandom.uuid, true_id: e.id, type: "book", link: e.link,
               published_year: e.published_year, created_at: e.created_at,
               description: e.description, explorer: e.explorer, images_count: e.images_count,
               painter: Painter.find_by(id: e.painter_id), slug: e.slug, title: e.title,
               user: User.find_by(id: e.user_id) }
      @books.append(item)
    }

    @explorers = @exhibitions + @paintings + @books
    @explorers = @explorers.sort_by {|obj| obj["explorer"]}
    # @explorers = @explorers.page params[:page]

    render json: @explorers
  end
end