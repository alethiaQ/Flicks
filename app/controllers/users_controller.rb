class UsersController < ApplicationController
  def new
    @user = User.new
    @genres = Genre.all
  end

  def create
    @user = User.create(user_params)
    params[:user][:genres].each do |genre|
      if !genre.empty?
        @user.user_genres.build(:genre_id => genre)
      end
    end

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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :uid, :image, :password_confirmation, :genres)
  end
end
