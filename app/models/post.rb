class Post < ApplicationRecord
  
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
  enum category: { おすすめスポット: 0, 空き家情報: 1 }
  
  attachment :image
  
end
