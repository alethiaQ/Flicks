class Genre < ActiveRecord::Base
  has_many :movies_genres
  has_many :movies, through: :movies_genres
  validates :name, inclusion: { in: %w(Horror Comedy Thriller Drama Action Documentary Romance Mystery) }
  validates :name, uniqueness: true
end
