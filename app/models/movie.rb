class Movie < ActiveRecord::Base
  has_many :movies_genres
  has_many :genres, through: :movies_genres
  accepts_nested_attributes_for :movies_genres
end
