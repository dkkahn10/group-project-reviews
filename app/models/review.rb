class Review < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  validates :intimacy_rating, numericality: {only_interger: true}, inclusion: {in: 1..5, message: "Rating must be between 1 - 5"}
  validates :upvote_count, presence: true
  validates :downvote_count, presence: true
  has_many :votes
  belongs_to :user
end
