class FilmsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_film, only: [:edit, :update, :destroy]

  def index
    @films = Film.order(created_at: :desc)
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      redirect_to films_path
    else
      render :new
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film.update(film_params)
    redirect_to films_path
  end

  def destroy
    @film.destroy
    redirect_to films_path
  end

  private

  def film_params
    params.require(:film).permit(:title, :date, :description, :photo)
  end

  def set_film
    @film = Film.find(params[:id])
  end
end
