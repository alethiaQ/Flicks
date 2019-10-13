class MoviesController < ApplicationController
  before_action :logged_in?
  before_action :admin_only, :except => [:show, :index]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    params[:movie][:genres].each do |genre|
      if !genre.empty?
        @movie.movies_genres.build(:genre_id => genre)
      end
    end
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :preview, :actors, :directors, :movies_genres_attributes => [:id, :genre_ids => []])
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
