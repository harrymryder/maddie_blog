class BooksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_book, only: [:edit, :update, :destroy]

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
    @book.update(book_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :photo)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
