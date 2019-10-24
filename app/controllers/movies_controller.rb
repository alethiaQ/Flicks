class MoviesController < ApplicationController
  before_action :logged_in?, :except => [:show, :index]

  #before_action :admin_only, :except => [:show, :index]

  def index
    #@movies = Movie.all
    @genres = Genre.all
    if !params[:genre].blank?
      @movies = Movie.by_genre(params[:genre])
      @search_genre = params[:genre]
    elsif params[:date] != nil
      @movies = Movie.upcoming_movies
    else
      @movies = Movie.all
    end

    #elsif !params[:by_title].blank?
    # @movies = Movie.by_title(params[:])
  end

  def show
    if params[:user_id]
      @movie = User.find(params[:user_id]).movies.find(params[:id])
    else
      @movie = Movie.find(params[:id])
    end
  end

  def new
    @movie = Movie.new(user_id: params[:user_id])
    @genres = Genre.all
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.build_movie_genres(params)

    if @movie.valid?
      @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.build_movie_genres(params)
    #@user = set_user

    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @genres = Genre.all
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to user_movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :preview, :actors, :director, :genres, :release_date, :user_id)
  end

  # def admin_only
  #   unless current_user.role == "admin"
  #     redirect_to root_path, :alert => "Access denied."
  #   end
  # end

  # if movie.release_date > todays.datetime
end
