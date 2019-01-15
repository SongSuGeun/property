class User < ApplicationRecord
  validates:name,  presence:true, length:{ maximum:30 }
  validates:email, presence:true, length:{ maximum:255 },
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true, allow_nil: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum:3 }
  
  before_validation { email.downcase! } 

  #mount_uploader :image, ImageUploader
  mount_uploader :icon_image, IconImageUploader
  
  has_many :property
  
  has_many :favorites, dependent: :destroy
  
end
