class Picture < ApplicationRecord
  # mount_uploader :pic, AvatarUploader
  belongs_to :user
  
end
