class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :likes
#  has_many :like_spots, through: :likes, class_name: 'Spot', source: :spot

  has_many :microposts
  
  
  def like(spot)
    self.likes.find_or_create_by(spot: spot)
  end
  
  def unlike(spot)
    like = self.likes.find_by(spot: spot)
    like.destroy if like
  end
  
  def likes?(spot)
    self.likes.pluck(:spot).include?(spot)
  end
  
end