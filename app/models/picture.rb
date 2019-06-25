class Picture < ApplicationRecord
  belongs_to :sitter
  belongs_to :user
  mount_uploader :pic, AvatarUploader
  
end
