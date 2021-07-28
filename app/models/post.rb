class Post < ApplicationRecord
  
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
  enum category: { おすすめスポット: 0, 空き家情報: 1 }
  
  attachment :image
  
  validates :image, :presence => {:message => '画像を入れてください'}
  validates :title, :presence => {:message => 'タイトルを入力してください'}
  validates :body, :presence => {:message => '内容を入力してください'}
  validates :location, :presence => {:message => '場所を入力してください'}
  
  validates :title, length: { maximum: 30}
  validates :body, length: { maximum: 200 }
  validates :location, length: { maximum: 25 }
  
end
