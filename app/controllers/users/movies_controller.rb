class Users::MoviesController < Users::BaseController
  before_action :fetch_movie, only: %i[show]

  def index
    @movies = Movie.all
  end

  def show; end

  def fetch_movie
    @movie = Movie.find_by(params[:id])
    unless @movie.present?
      flash[:danger] = "movie not found"
    end
  end
end
