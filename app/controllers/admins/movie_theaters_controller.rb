class Admins::MovieTheatersController < Admins::BaseController

  def index
    @movie_theaters = MovieTheater.page(params[:page]).per(5)
  end

  def new
    @movie_theater = MovieTheater.new
  end

  def edit; end

  def update
    if @movie_theater.update_attributes(user_params)
      flash[:success] = "Update success"
      render "show"
    else
      render 'edit'
    end
  end

  def create
    @movie_theater = MovieTheater.new(movie_params)
    if @movie_theater.save
      flash[:success] = "create movie success"
      render "index"
    else
      flash[:danger] = "create movie fail"
      render 'new'
    end
  end

  def show; end

  def fetch_movie
    @movie_theater = Movie.find_by(params[:id])
    unless @movie_theater.present?
      flash[:danger] = "movie not found"
    end
  end

  private

  def movie_theater_params
    params.require(:movie_theater).permit :name, :address, :province
  end

end
