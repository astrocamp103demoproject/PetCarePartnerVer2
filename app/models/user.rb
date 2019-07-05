class User < ApplicationRecord
  # mount_uploader :avatar, AvatarUploader
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true
  
  has_many :pets
  has_many :orders
  has_many :comments
  has_many :pictures

  scope :semail_to_uemail,->(semail){ where("email = ?",semail) }

end
