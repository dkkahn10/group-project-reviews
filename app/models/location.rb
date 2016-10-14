class Location < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name_of_location , presence: true
  validates :description , presence: true

  def self.search(search)
    where("name_of_location ILIKE ? OR description ILIKE ?",
          "%#{search}%",
          "%#{search}%")
  end
end
