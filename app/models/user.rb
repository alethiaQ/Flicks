class User < ActiveRecord::Base
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_secure_password
  has_many :genres
  has_many :movies, through: :genres
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def set_default_role
    self.role ||= :user
  end

  def self.find_or_create_by_omniauth(auth)
    # @user = User.find_or_create_by(uid: auth["uid"]) do |u|
    #u.name = auth["info"]["name"]
    ##u.email = auth["info"]["email"]
    #u.image = auth["info"]["image"]
    self.where(email: auth["info"]["email"]).first_or_create do |user|
      user.name = auth["info"]["name"]
      user.password = SecureRandom.hex
      user.image = auth["info"]["image"]
      user.email = auth["info"]["email"]
      user.uid = auth["uid"]
    end
  end
end
