# frozen_string_literal: true
class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true
  has_many :votes
  has_many :reviews, through: :votes
  has_many :locations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
