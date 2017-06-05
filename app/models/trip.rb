class Trip < ApplicationRecord
  mount_uploader :coverpic, CoverpicUploader

  belongs_to :user
  belongs_to :country
  has_many :activities, :foreign_key => "trip_id", :dependent => :destroy
  validates :trip_name, :presence => true
  validates :trip_name, :uniqueness => true
  validates :start_date, :presence => true
  validates :rating, :presence => true
  validates :end_date, :presence => true
  validates :country_id, :presence => true
  validate :end_date_cannot_be_before_start_date
  def end_date_cannot_be_before_start_date
    if start_date>end_date
      errors.add(:end_date,"can't be before start date")
    end
  end

  validate :end_date_cannot_be_in_the_future
  def end_date_cannot_be_in_the_future
    if start_date>Date.today
      errors.add(:start_date,"can't be after Today")
    elsif end_date>Date.today
      errors.add(:end_date,"can't be after Today")
    end
  end

end
