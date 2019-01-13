class BooksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @books = Book.order(created_at: :desc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :photo)
  end
end
