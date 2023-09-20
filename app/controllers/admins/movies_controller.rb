class Admins::MoviesController < Admins::BaseController
  before_action :fetch_movie, only: %i[show, edit, update]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  def update
    if @movie.update_attributes(user_params)
      flash[:success] = "Update success"
      render "show"
    else
      render 'edit'
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = "create movie success"
      render "index"
    else
      flash[:danger] = "create movie fail"
      render 'new'
    end
  end

  def show; end

  def fetch_movie
    @movie = Movie.find_by(params[:id])
    unless @movie.present?
      flash[:danger] = "movie not found"
    end
  end

  private

  def movie_params
    params.require(:movie).permit :name, :director, :actors, :description, :country, :genre, :releaseDate, :movie_theater_id
  end

end
