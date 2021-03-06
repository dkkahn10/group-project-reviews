class Review < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  validates :intimacy_rating, numericality: { only_integer: true }, inclusion: { in: 1..5, message: "Rating must be between 1 - 5" }
  validates :votes_total, presence: true
  has_many :votes

  def tally
    sum = 0
    votes.each do |vote|
      if vote.vote_value == true
        sum += 1
      elsif vote.vote_value == false
        sum -= 1
      end
    end
    sum
  end
end
