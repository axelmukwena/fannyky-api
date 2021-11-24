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
      render json: { success: true, talk: @talk, message: 'Talk created.' }
    else
      render json: { success: false, message: @talk.errors.full_messages }
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
      render json: { success: true, talk: @talk, message: 'Talk updated.' }
    else
      render json: { success: false, message: @talk.errors.full_messages }
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
    if @talk.destroy
      render json: { success: true, message: 'Talk deleted.' }
    else
      render json: { success: false, message: @talk.errors.full_messages }
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def talk_params
    params.require(:talk).permit(:title, :description, :date,
                                 :organizer, :location, :link, painter: @painter,
                                 user: current_user)
  end

  def set_talk
    @talk = Talk.friendly.find(params[:id])
  end
end
