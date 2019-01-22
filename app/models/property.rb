class Property < ApplicationRecord
  validates:name,  presence:true, length:{ minimum:6 }
  validates:image, presence:true
  validates:rent, presence:true
  validates:region, presence:true
  validates:latitude, presence:true
  validates:longitude, presence:true
  validates:area, presence:true
  
  mount_uploaders :image, ImageUploader
  
  serialize :image, JSON
  #mount_uploader :image, ImageUploader
  
  mount_uploader :video, VideoUploader
  #validates_presence_of
  

  #is_impressionable
  has_many :impressions, :as=>:impressionable
  #is_impressionable :counter_cache => true
  is_impressionable counter_cache: true
  #, :unique => true
  
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  
  #용량제한 바리데이션
  #def size_range  
  #  1..5.megabytes
  #end
  
end
