class PaintingsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_painter
  before_action :set_painting, except: [:new, :create, :index]

  def new
    @painting = Painting.new
  end

  def create
    @painting = @painter.paintings.build(painting_params)

    if @painting.save
      render json: { message: 'Painting created.' }, status: :ok
    else
      render json: { message: @painting.errors.full_messages[0] }, status: :bad_request
    end
  end

  def index
    @paintings = @painter.paintings
    @paintings.order(date_created: :desc).page params[:page]
    render json: @paintings
  end

  def show
    render json: @painting
  end

  def update
    if @painting.valid?
      @painting.update(painting_params)
      render json: { message: 'Painting updated.' }, status: :ok
    else
      render json: { message: @painting.errors.full_messages[0] }, status: :bad_request
    end
  end

  def destroy
    if @painting.destroy
      render json: { message: 'Painting deleted.' }, status: :ok
    else
      render json: { message: @painting.errors.full_messages[0] }, status: :bad_request
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def painting_params
    params.require(:painting).permit(:title, :description, :date_created, painter: @painter, user: current_user)
  end

  def set_painting
    @painting = Painting.friendly.find(params[:id])
  end
end
