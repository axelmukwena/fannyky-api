class PaintingsController < ApplicationController
  before_action :authorized, except: [:index, :show, :category_index]
  before_action :set_painter
  before_action :set_painting, except: [:new, :create, :index, :category_index]

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
    @paintings = @painter.paintings.order(rankdate: :desc)
    @paintings.page params[:page]
    render json: @paintings
  end

  # get paintings based on category, only applies to buda
  def category_index
    if params.has_key?(:category_slug)
      @paintings = @painter.paintings.where(category_slug: params[:category_slug])
      @paintings = @paintings.order(rankdate: :desc)
      render json: @paintings
    else
      render json: { success: false, record: false }
    end
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
    params.require(:painting).permit(:title, :pagelink, :description,
                                     :date_created, :rankdate, :abstract, :dimension,
                                     :category, :painter_id, user: current_user)
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