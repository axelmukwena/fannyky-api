class AwardsController < ApplicationController
  before_action :authorized, except: [:index, :show]
  before_action :set_painter
  before_action :set_award, except: [:new, :create, :index]

  def new
    @award = Award.new
  end

  def create
    @award = current_user.awards.build(award_params)
    @award.painter = @painter

    if @award.save
      render json: { success: true, award: @award, message: 'Award created.' }
    else
      render json: { success: false, message: @award.errors.full_messages }
    end
  end

  def index
    @awards = @painter.awards
    @awards.order(year: :desc).page params[:page]
    render json: @awards
  end

  def show
    render json: @award
  end

  def update
    if @award.valid?
      @award.update(award_params)
      render json: { success: true, award: @award, message: 'Award updated.' }
    else
      render json: { success: false, message: @award.errors.full_messages }
    end
  end

  def create_images
    if params.has_key?(:images)
      if @award.images.attach(params[:images])
        render json: { success: true, award: @award, message: 'Images Added.' }
      else
        render json: { success: false, message: @award.errors.full_messages }
      end
    end
  end

  def delete_image
    if params.has_key?(:image_id)
      @image = @award.images.find(params[:image_id])
      if @image
        @image.purge
        render json: { success: true, award: @award, message: 'Image Deleted.' }
      else
        render json: { success: false, message: @award.errors.full_messages }
      end
    end
  end

  def destroy
    if @award.destroy
      render json: { success: true, message: 'Award deleted.' }
    else
      render json: { success: false, message: @award.errors.full_messages }
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

  def award_params
    params.require(:award).permit(:prize, :pagelink, :description,
                                  :year, painter: @painter, user: current_user)
  end

  def set_award
    begin
      @award = Award.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { record: false, message: 'Could not find award.' }
    end
  end
end

