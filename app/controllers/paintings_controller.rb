class PaintingsController < ApplicationController
  before_action :authorized, except: [:index, :show]
  before_action :set_painter
  before_action :set_painting, except: [:new, :create, :index]

  def new
    @painting = Painting.new
  end

  def create
    @painting = current_user.paintings.build(painting_params)
    @painting.painter = @painter

    if @painting.save
      render json: { success: true, painting: @painting, message: 'Painting created.' }
    else
      render json: { success: false, message: @painting.errors.full_messages }
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
      render json: { success: true, painting: @painting, message: 'Painting updated.' }
    else
      render json: { success: false, message: @painting.errors.full_messages }
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
    if @painting.destroy
      render json: { success: true, message: 'Painting deleted.' }
    else
      render json: { success: false, message: @painting.errors.full_messages }
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def painting_params
    params.require(:painting).permit(:title, :description, :date_created,
                                     :abstract, :dimension, :painter_id,
                                     user: current_user)
  end

  def set_painting
    @painting = Painting.friendly.find(params[:id])
  end
end