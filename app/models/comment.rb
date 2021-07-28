class Comment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :post
  
  validates :comment, :presence => {:message => 'コメントを入力してください'}
  
  validates :title, length: { maximum: 200}
  
end
