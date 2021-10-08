class PaintersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_painter, except: [:new, :create, :index]

  def new
    @painter = Painter.new
  end

  def create
    @painter = current_user.painters.build(painter_params)

    if @painter.save
      render json: { message: 'Painter created.' }, status: :ok
    else
      render json: { message: @painter.errors.full_messages[0] }, status: :bad_request
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
      render json: { message: 'Painter updated.' }, status: :ok
    else
      render json: { message: @painter.errors.full_messages[0] }, status: :bad_request
    end
  end

  def destroy
    if @painter.destroy
      render json: { message: 'Painter deleted.' }, status: :ok
    else
      render json: { message: @painter.errors.full_messages[0] }, status: :bad_request
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