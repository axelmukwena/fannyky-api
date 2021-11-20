class TalksController < ApplicationController
  before_action :authorized, except: [:index, :show]
  before_action :set_painter
  before_action :set_talk, except: [:new, :create, :index]

  def new
    @talk = Talk.new
  end

  def create
    @talk = current_user.talks.build(talk_params)
    @talk.painter = @painter

    if @talk.save
      render json: { message: 'Talk created.' }, status: :ok
    else
      render json: { message: @talk.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @talks = @painter.talks
    @talks.order(date_created: :desc).page params[:page]
    render json: @talks
  end

  def show
    render json: @talk
  end

  def update
    if @talk.valid?
      @talk.update(talk_params)
      render json: { message: 'Talk updated.' }, status: :ok
    else
      render json: { message: @talk.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @talk.destroy
      render json: { message: 'Talk deleted.' }, status: :ok
    else
      render json: { message: @talk.errors.full_messages }, status: :bad_request
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def talk_params
    params.require(:talk).permit(:title, :description, :date,
                                 :organizer, :location, :link, painter: @painter,
                                 user: current_user, images: [])
  end

  def set_talk
    @talk = Talk.friendly.find(params[:id])
  end
end
