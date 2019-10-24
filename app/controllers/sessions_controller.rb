class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to @user
    else
      user = User.find_by(email: params[:user][:email])
      user = user.try(:authenticate, params[:user][:password])
      if !user
        redirect_to(controller: "sessions", action: "new")
      end
      session[:user_id] = user.id
      @user = user

      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end
end
