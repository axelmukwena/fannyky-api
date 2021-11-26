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
    @publications.order(year: :desc).page params[:page]
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
      if @publication.images.attach(params[:images])
        render json: { success: true, publication: @publication, message: 'Images Added.' }
      else
        render json: { success: false, message: @publication.errors.full_messages }
      end
    end
  end

  def delete_image
    if params.has_key?(:image_id)
      @image = @publication.images.find(params[:image_id])
      if @image
        @image.purge
        render json: { success: true, publication: @publication, message: 'Image Deleted.' }
      else
        render json: { success: false, message: @publication.errors.full_messages }
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
    begin
      @painter = Painter.friendly.find(params[:painter_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { record: false, message: 'Could not find painter.' }
    end
  end

  def publication_params
    params.require(:talk).permit(:title, :page_link, :description, :year,
                                 :organization, :location, painter: @painter,
                                 user: current_user)
  end

  def set_publication
    begin
      @publication = Publication.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { record: false, message: 'Could not find publication.' }
    end
  end
end
