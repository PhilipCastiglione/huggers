class Profile_photo < ActiveRecord::Base
  validates :user_id, :link, :presence => true
  validates :link, :uniqueness => true
  belongs_to :user
end
