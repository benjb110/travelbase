class Country < ApplicationRecord

has_many :native_users, :class_name => "User", :foreign_key => "country_born_id", :dependent => :destroy
has_many :residing_users, :class_name => "User", :foreign_key => "country_residing_id", :dependent => :destroy
has_many :trips, :dependent => :destroy
validates :name, :presence => true
validates :name, :uniqueness => true




end
