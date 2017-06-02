class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :visits, :dependent => :destroy
  belongs_to :country_born, :class_name => "Country"
  belongs_to :country_residing, :class_name => "Country"

  has_many :activities, :through => :visits, :source => :activities
  validates :username, :length => { :minimum => 6, :maximum => 12 }
  validates :username, :presence => { :message => "Please add username :)" }
  validates :username, :uniqueness => { :message => "That username has been taken :(" }
  validates :country_residing_id, :presence => { :message => "Can't be blank" }
  validates :country_born_id, :presence => { :message => "Can't be blank" }
  validates :age, :presence => { :message => "Please add age :)" }
end
