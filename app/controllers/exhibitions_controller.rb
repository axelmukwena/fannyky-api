class ExhibitionsController < ApplicationController
  before_action :authorized, except: [:index, :show]
  before_action :set_painter
  before_action :set_exhibition, except: [:new, :create, :index]

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = current_user.exhibitions.build(exhibition_params)
    @exhibition.painter = @painter

    if @exhibition.save
      render json: { success: true, exhibition: @exhibition, message: 'Exhibition created.' }
    else
      render json: { success: false, message: @exhibition.errors.full_messages }
    end
  end

  def index
    @exhibitions = @painter.exhibitions.order(rankdate: :desc)
    @exhibitions.page params[:page]
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
      if @exhibition.images.attach(params[:images])
        render json: { success: true, exhibition: @exhibition, message: 'Images Added.' }
      else
        render json: { success: false, message: @exhibition.errors.full_messages }
      end
    end
  end

  def delete_image
    if params.has_key?(:image_id)
      @image = @exhibition.images.find(params[:image_id])
      if @image
        @image.purge
        render json: { success: true, exhibition: @exhibition, message: 'Image Deleted.' }
      else
        render json: { success: false, message: @exhibition.errors.full_messages }
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
    begin
      @painter = Painter.friendly.find(params[:painter_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { record: false, message: 'Could not find painter.' }
    end
  end

  def exhibition_params
    params.require(:exhibition).permit(:title, :pagelink, :rankdate, :description,
                                       :start_date, :end_date, :link, :organization,
                                       :location, :which, painter: @painter,
                                       user: current_user)
  end

  def set_exhibition
    begin
      @exhibition = Exhibition.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { record: false, message: 'Could not find exhibition.' }
    end
  end
end
