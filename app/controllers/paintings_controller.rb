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

  def delete_image
    if params.has_key?(:image_id)
      @image = @painting.images.find(params[:image_id])
      if @image
        @image.purge
        render json: { success: true, painting: @painting, message: 'Image Deleted.' }
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
    begin
      @painter = Painter.friendly.find(params[:painter_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { record: false, message: 'Could not find painter.' }
    end
  end

  def painting_params
    params.require(:painting).permit(:title, :page_link, :description,
                                     :date_created, :abstract, :dimension,
                                     :painter_id, user: current_user)
  end

  # Friendly ID does not return Nil when record is not found
  def set_painting
    begin
      @painting = Painting.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { record: false, message: 'Could not find painting.' }
    end
  end
end