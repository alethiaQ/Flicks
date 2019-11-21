class UsersController < ApplicationController
  def new
    @user = User.new
    @genres = Genre.all
  end

  def create
    @user = User.new(user_params)
    @user.build_user_genres(params) unless !params[:user][:genres]

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @genres = Genre.all
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params) unless !@user.save
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :uid, :image, :password_confirmation, :genres, :movies)
  end
end
