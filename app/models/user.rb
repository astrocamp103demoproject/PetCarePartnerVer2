class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :name, presence: true
  
  has_many :pets
  has_many :orders

  geocoded_by :address        #從address欄位取出地址
  after_validation :geocode   #將取出的地址自動轉為經緯度分別存在 latitude、longitude 欄位
end
