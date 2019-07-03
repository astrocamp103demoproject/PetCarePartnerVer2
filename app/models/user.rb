class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  
  has_many :pets
  has_many :orders
  has_many :comments
  has_many :pictures

  scope :semail_to_uemail,->(semail){ where("email = ?",semail).pluck(:id) }

end
