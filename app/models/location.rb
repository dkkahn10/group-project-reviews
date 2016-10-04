class Location < ActiveRecord::Base

  validates :name_of_location , presence: true
  validates :description , presence: true
end
