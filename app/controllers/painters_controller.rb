class PaintersController < ApplicationController
  before_action :find_painter, only: :show
  def index
    @painters = User.all
    render json: @painters
  end

  def show
    render json: @painter
  end

  private
  def find_painter
    @painter = User.find(params[:id])
  end
end