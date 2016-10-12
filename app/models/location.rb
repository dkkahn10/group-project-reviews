class Location < ActiveRecord::Base
  has_many :reviews
  validates :name_of_location , presence: true
  validates :description , presence: true

  def self.search(search)
    where("name_of_location ILIKE ?", "%#{search}%") ||
      where("description ILIKE ?", "%#{search}%")
  end
end
