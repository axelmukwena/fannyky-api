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
    @painters = Painter.order(rank: :asc).page params[:page]
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
      if @painter.images.attach(params[:images])
        render json: { success: true, painter: @painter, message: 'Images Added.' }
      else
        render json: { success: false, message: @painter.errors.full_messages }
      end
    end
  end

  def delete_image
    if params.has_key?(:image_id)
      @image = @painter.images.find(params[:image_id])
      if @image
        @image.purge
        render json: { success: true, painter: @painter, message: 'Image Deleted.' }
      else
        render json: { success: false, message: @painter.errors.full_messages }
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

  def painter_params
    params.require(:painter).permit(:name, :rank, :pagelink, :about, :email, :phone,
                                    :link, :paintings_categories, menuitems: [],
                                    user: current_user)
  end

  def set_painter
    begin
      @painter = Painter.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { success: true, record: false, message: 'Could not find painter.' }
    end
  end

end