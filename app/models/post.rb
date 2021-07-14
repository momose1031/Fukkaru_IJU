class Post < ApplicationRecord
  
  belongs_to :customer
  
  enum category: { おすすめスポット: 0, 空き家情報: 1 }
  
  attachment :image
  
end
