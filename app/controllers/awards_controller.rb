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
      render json: { message: 'Award created.' }, status: :ok
    else
      render json: { message: @award.errors.full_messages }, status: :bad_request
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
      render json: { message: 'Award updated.' }, status: :ok
    else
      render json: { message: @award.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @award.destroy
      render json: { message: 'Award deleted.' }, status: :ok
    else
      render json: { message: @award.errors.full_messages }, status: :bad_request
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def award_params
    params.require(:talk).permit(:title, :description, :year,
                                 :organizer, painter: @painter,
                                 user: current_user, images: [])
  end

  def set_award
    @award = Award.friendly.find(params[:id])
  end
end

