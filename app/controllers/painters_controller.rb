class PaintersController < ApplicationController
  attr_reader :painter
  before_action :authorized, except: [:index, :show]
  before_action :set_painter, except: [:new, :create, :index]

  def new
    @painter = Painter.new
  end

  def create
    @painter = current_user.painters.build(painter_params)

    if @painter.save
      render json: { success: true, painter: @painter, message: 'Painter created.' }
    else
      render json: { success: false, message: @painter.errors.full_messages }
    end
  end

  def index
    @painters = Painter.order(created_at: :desc).page params[:page]
    render json: @painters
  end

  def show
    render json: @painter
  end

  def update
    if @painter.valid?
      @painter.update(painter_params)
      render json: { success: true, painter: @painter, message: 'Painter updated.' }
    else
      render json: { success: false, message: @painter.errors.full_messages }
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
    if @painter.destroy
      render json: { success: true, message: 'Painter deleted.' }
    else
      render json: { success: false, message: @painter.errors.full_messages }
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:id])
  end

  def painter_params
    params.require(:painter).permit(:name, :about,
                                    :email, :phone, :facebook,
                                    :instagram, :twitter,
                                    user: current_user, images: [])
  end
end