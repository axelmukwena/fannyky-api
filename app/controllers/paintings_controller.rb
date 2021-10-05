class PaintingsController < ApplicationController
  before_action :find_painting, only: :show
  def index
    @paintings = Painting.all
    render json: @paintings
  end

  def show
    render json: @painting
  end

  private
  def find_painting
    @painting = Painting.find(params[:id])
  end
end
