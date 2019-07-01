class Picture < ApplicationRecord
  belongs_to :user
  
  mount_uploader :pic, AvatarUploader
end
