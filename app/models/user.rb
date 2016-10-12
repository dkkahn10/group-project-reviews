class User < ApplicationRecord
  mount_uploader :profile_picture, ProfilePictureUploader

  validates :username, presence: true
  validates :email, presence: true

  has_many :reviews
  has_many :locations

  def admin?
    role == 'admin'
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
