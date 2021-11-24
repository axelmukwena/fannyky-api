class ExhibitionsController < ApplicationController
  before_action :authorized, except: [:index, :show]
  before_action :set_painter
  before_action :set_exhibition, except: [:new, :create, :index]

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = @painter.exhibitions.build(exhibition_params)

    if @exhibition.save
      render json: { success: true, exhibition: @exhibition, message: 'Exhibition created.' }
    else
      render json: { success: false, message: @exhibition.errors.full_messages }
    end
  end

  def index
    @exhibitions = @painter.exhibitions
    @exhibitions.order(start_date: :desc).page params[:page]
    render json: @exhibitions
  end

  def show
    render json: @exhibition
  end

  def update
    if @exhibition.valid?
      @exhibition.update(exhibition_params)
      render json: { success: true, exhibition: @exhibition, message: 'Exhibition updated.' }
    else
      render json: { success: false, message: @exhibition.errors.full_messages }
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
    if @exhibition.destroy
      render json: { success: true, message: 'Exhibition deleted.' }
    else
      render json: { success: false, message: @exhibition.errors.full_messages }
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def exhibition_params
    params.require(:exhibition).permit(:title, :description,
                                       :start_date, :end_date, :link,
                                       :location, :type, painter: @painter,
                                       user: current_user, images: [])
  end

  def set_exhibition
    @exhibition = Exhibition.friendly.find(params[:id])
  end
end
