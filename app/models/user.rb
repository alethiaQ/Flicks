class User < ActiveRecord::Base
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :user_genres
  has_many :genres, through: :user_genres

  has_many :movies
  validates :name, :email, presence: true
  validates :email, uniqueness: true, :if => :new_record?
  has_secure_password

  def set_default_role
    self.role ||= :user
  end

  def build_user_genres(params)
    @user = User.find_by(email: params[:user][:email])
    params[:user][:genres].each do |genre|
      if !genre.empty?
        @user.user_genres.build(:genre_id => genre)
        @user.save
      end
    end
  end

  def self.find_or_create_by_omniauth(auth)
    self.where(email: auth["info"]["email"]).first_or_create do |user|
      user.name = auth["info"]["name"]
      user.password = SecureRandom.hex
      user.image = auth["info"]["image"]
      user.email = auth["info"]["email"]
      user.uid = auth["uid"]
    end
  end
end
