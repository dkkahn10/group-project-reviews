class User < ApplicationRecord
<<<<<<< HEAD
  mount_uploader :profile_picture, ProfilePictureUploader

  validates :username, presence: true
  validates :email, presence: true

=======
  validates :username, presence: true
  validates :email, presence: true

  has_many :reviews
  has_many :locations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
>>>>>>> origin/master
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
