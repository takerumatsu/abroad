class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  validates :image, presence: true
  

  
  mount_uploader :image, ImageUploader
  


end
