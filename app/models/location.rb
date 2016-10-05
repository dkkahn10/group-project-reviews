class Location < ActiveRecord::Base
  has_many :reviews
  validates :name_of_location , presence: true
  validates :description , presence: true
end
