class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy
         
  enum conutry: { 県民の方: 0, 移住に興味のある方: 1 }
  
  attachment :image
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
end