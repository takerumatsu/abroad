class Like < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  

#ランキング
=begin
  def like.ranking
    
  end
=end
  
end
