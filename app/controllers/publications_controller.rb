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
      render json: { message: 'Publication created.' }, status: :ok
    else
      render json: { message: @publication.errors.full_messages }, status: :bad_request
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
      render json: { message: 'Publication updated.' }, status: :ok
    else
      render json: { message: @publication.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @publication.destroy
      render json: { message: 'Publication deleted.' }, status: :ok
    else
      render json: { message: @publication.errors.full_messages }, status: :bad_request
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
