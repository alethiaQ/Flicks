class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def welcome
    @user = User.find_by(id: session[:user_id])
  end

  def home
    @user = User.find_by(id: session[:user_id])
  end

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  private

  def logged_in?
    if !current_user
      redirect_to "/login"
    end
  end
end
