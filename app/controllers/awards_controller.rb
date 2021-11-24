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
    @awards.order(date_created: :desc).page params[:page]
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
      if @painting.images.attach(params[:images])
        render json: { success: true, painting: @painting, message: 'Images Added.' }
      else
        render json: { success: false, message: @painting.errors.full_messages }
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
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def award_params
    params.require(:award).permit(:title, :description, :year,
                                 :organizer, painter: @painter,
                                 user: current_user, images: [])
  end

  def set_award
    @award = Award.friendly.find(params[:id])
  end
end

