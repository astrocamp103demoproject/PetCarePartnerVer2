class Sitter < ApplicationRecord
  # mount_uploader :avatar, AvatarUploader
  # mount_uploader :pic, PictureUploader
  validates :name, presence: true

  has_many :booking_dates
  has_many :orders
end
