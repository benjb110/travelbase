class Trip < ApplicationRecord

  belongs_to :user
  belongs_to :country
  has_many :activities, :foreign_key => "trip_id", :dependent => :destroy
  validates :trip_name, :presence => true
  validates :trip_name, :uniqueness => true
  validates :start_date, :presence => true
  validates :rating, :presence => true
  validates :end_date, :presence => true
  validates :country_id, :presence => true
end
