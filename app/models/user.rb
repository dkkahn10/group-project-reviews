class User < ApplicationRecord
  mount_uploader :profile_picture, ProfilePictureUploader

  validates :username, presence: true
  validates :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
