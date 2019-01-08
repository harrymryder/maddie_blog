class FilmsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @film = Film.new
  end
end
