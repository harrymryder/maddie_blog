class BooksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @book = Book.new
  end
end
