class Movie < ActiveRecord::Base
  has_many :movies_genres
  has_many :genres, through: :movies_genres
  belongs_to :user

  validate :is_date_format
  validates :title, :actors, :director, :description, presence: true

  def build_movie_genres(params)
    @movie = Movie.find(params[:id])

    params[:movie][:genres].each do |genre|
      if !genre.empty?
        @movie.movies_genres.build(:genre_id => genre)
        @movie.save
      end
    end
  end

  def self.upcoming_movies
    where("release_date > ?", Date.today).order(release_date: :desc)
  end

  def self.by_genre(genre_name)
    self.joins(:genres).where(genres: { name: genre_name })
  end

  def self.by_title(title)
    where(title: title)
  end
  def self.by_director(director)
    where(director: director)
  end

  private

  def is_date_format
    return true if self.release_date == "nil"
    self.release_date.to_date ? true : errors.add(:release_date, "You must enter a valid date, for example: Jun 12, 2016")
  end
end
