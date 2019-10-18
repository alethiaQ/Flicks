class Movie < ActiveRecord::Base
  has_many :movies_genres
  has_many :genres, through: :movies_genres
  has_many :user_movies 
  has_many :users, through: :user_movies
end
