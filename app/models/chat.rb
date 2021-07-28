class Chat < ApplicationRecord
  
  belongs_to :customer
  belongs_to :room
  
  validates :message, :presence => {:message => 'コメントを入力してください'}
  
  validates :message, length: { maximum: 200}
  
end
