class Sitter < ApplicationRecord
  # mount_uploader :avatar, AvatarUploader
  # mount_uploader :pic, PictureUploader
  validates :square_meters, numericality: { greater_than_or_equal_to:1 }
  validates :pet_limit, numericality: { greater_than_or_equal_to:1 }
  validates :price, numericality: { greater_than_or_equal_to:1 }
  validates :name, presence: true
  validates :address, presence: true
  
  has_many :booking_dates
  has_many :orders

  # accepts_nested_attributes_for :booking_dates
  
  geocoded_by :address        #從address欄位取出地址
  after_validation :geocode   #將取出的地址自動轉為經緯度分別存在 latitude、longitude 欄位

end
