class BooksController < ApplicationController
  before_action :authorized, except: [:index, :show]
  before_action :set_painter
  before_action :set_book, except: [:new, :create, :index]

  def new
    @book = Book.new
  end

  def create
    @book = @painter.books.build(book_params)

    if @book.save
      render json: { message: 'Book created.' }, status: :ok
    else
      render json: { message: @book.errors.full_messages[0] }, status: :bad_request
    end
  end

  def index
    @books = @painter.books
    @books.order(created_at: :desc).page params[:page]
    render json: @books
  end

  def show
    render json: @book
  end

  def update
    if @book.valid?
      @book.update(book_params)
      render json: { message: 'Book updated.' }, status: :ok
    else
      render json: { message: @book.errors.full_messages[0] }, status: :bad_request
    end
  end

  def destroy
    if @book.destroy
      render json: { message: 'Book deleted.' }, status: :ok
    else
      render json: { message: @book.errors.full_messages[0] }, status: :bad_request
    end
  end

  private

  def set_painter
    @painter = Painter.friendly.find(params[:painter_id])
  end

  def book_params
    params.require(:book).permit(:title, :description,
                                       :published_year, :link,
                                       :location, painter: @painter,
                                       user: current_user, images: [])
  end

  def set_book
    @book = Book.friendly.find(params[:id])
  end
end
