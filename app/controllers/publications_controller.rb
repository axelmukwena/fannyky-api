class PublicationsController < ApplicationController
  before_action :authorized, except: [:index, :show]
  before_action :set_painter
  before_action :set_publication, except: [:new, :create, :index]

  def new
    @publication = Publication.new
  end

  def create
    @publication = current_user.publications.build(publication_params)
    @publication.painter = @painter

    if @publication.save
      render json: { success: true, publication: @publication, message: 'Publication created.' }
    else
      render json: { success: false, message: @publication.errors.full_messages }
    end
  end

  def index
    @publications = @painter.publications
    @publications.order(date_created: :desc).page params[:page]
    render json: @publications
  end

  def show
    render json: @publication
  end

  def update
    if @publication.valid?
      @publication.update(publication_params)
      render json: { success: true, publication: @publication, message: 'Publication updated.' }
    else
      render json: { success: false, message: @publication.errors.full_messages }
    end
  end

  def create_images
    if params.has_key?(:images)
      if @painting.images.attach(params[:images])
        render json: { success: true, painting: @painting, message: 'Images Added.' }
      else
        render json: { success: false, message: @painting.errors.full_messages }
      end
    end
  end

  def destroy
    if @publication.destroy
      render json: { success: true, message: 'Publication deleted.' }
    else
      render json: { success: false, message: @publication.errors.full_messages }
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def publication_params
    params.require(:talk).permit(:title, :description, :year,
                                 :organization, :location, painter: @painter,
                                 user: current_user, images: [])
  end

  def set_publication
    @publication = Publication.friendly.find(params[:id])
  end
end
