class Sitter < ApplicationRecord
  # mount_uploader :avatar, AvatarUploader
  # mount_uploader :pic, PictureUploader

  has_many :booking_dates
end
