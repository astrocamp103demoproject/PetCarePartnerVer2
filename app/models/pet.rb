class Pet < ApplicationRecord
  mount_uploader :pic, AvatarUploader

  validates :name, :size, presence: true

  belongs_to :user
end
