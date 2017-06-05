class Activity < ApplicationRecord
  mount_uploader :photos, PhotosUploader
  belongs_to :trip, :class_name => "Trip"
  has_one :user, :through => :trip, :source => :user
  validates :name, :presence => true
  validates :trip_id, :presence => true
  validates :name, :uniqueness => { :scope => [:trip_id] }

  validate :when_happened_cannot_be_in_the_future
  def when_happened_cannot_be_in_the_future
    if when_happened>Date.today
      errors.add(:date,"can't be after Today")
    end
  end

end
