class User < ActiveRecord::Base
  validates :email, :first_name, :last_name, :dob, :gender, :relationship, :nationality, :location, :presence => true
  validates :email, :uniqueness => true
  has_many :profile_photos
  
  has_secure_password
end
