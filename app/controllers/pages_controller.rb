class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def about
  end

  def articles
    @post = Post.new
  end

  def books
  end

  def film
  end
end
