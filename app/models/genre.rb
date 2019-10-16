class Genre < ActiveRecord::Base
  has_many :user_genres
  has_many :users, through: :user_genres
  has_many :movies_genres
  has_many :movies, through: :movies_genres
  validates :name, inclusion: { in: %w(Horror Comedy Thriller Drama Action Documentary Romance Mystery Family Animation) }
end
