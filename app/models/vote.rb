class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  validates :vote_value, presence: true
end
