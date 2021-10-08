class ExhibitionsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_painter
  before_action :set_exhibition, except: [:new, :create, :index]

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = @painter.exhibitions.build(exhibition_params)

    if @exhibition.save
      render json: { message: 'Exhibition created.' }, status: :ok
    else
      render json: { message: @exhibition.errors.full_messages[0] }, status: :bad_request
    end
  end

  def index
    @exhibitions = @painter.exhibitions.
      order(start_date: :desc).page params[:page]
    render json: @exhibitions
  end

  def show
    render json: @exhibition
  end

  def update
    if @exhibition.valid?
      @exhibition.update(exhibition_params)
      render json: { message: 'Exhibition updated.' }, status: :ok
    else
      render json: { message: @exhibition.errors.full_messages[0] }, status: :bad_request
    end
  end

  def destroy
    if @exhibition.destroy
      render json: { message: 'Exhibition deleted.' }, status: :ok
    else
      render json: { message: @exhibition.errors.full_messages[0] }, status: :bad_request
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def exhibition_params
    params.require(:exhibition).permit(:title, :description, :start_date,
                                       :end_date, :link, :location, painter: @painter, user: current_user)
  end

  def set_exhibition
    @exhibition = Exhibition.friendly.find(params[:id])
  end
end
