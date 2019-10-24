module MovieHelper
  def is_user_movie?(movie)
    movie.user_id == session[:user_id] ? true : false
  end
end
