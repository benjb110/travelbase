class Activity < ApplicationRecord
 mount_uploader :photos, PhotosUploader
belongs_to :trip, :class_name => "Trip"
has_one :user, :through => :trip, :source => :user
validates :name, :presence => true
validates :trip_id, :presence => true
validates :name, :uniqueness => { :scope => [:trip_id] }

end
