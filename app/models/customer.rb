class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy
  has_many :customer_rooms
  has_many :chats
 
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy  #自分がフォローされる側
  has_many :followers, through: :reverse_of_relationships, source: :follower #自分をフォローしている人
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #自分がフォローする側
  has_many :followings, through: :relationships, source: :followed #自分がフォローしている人
  
  enum conutry: { 県民の方: 0, 移住に興味のある方: 1 }
  
  attachment :image
  
  def follow(customer_id) #フォローする
    relationships.create(followed_id: customer_id)
  end
  
  def unfollow(customer_id) #フォロー解除
    relationships.find_by(followed_id: customer_id).destroy
  end
  
  def following?(customer) #フォローしているか確認
    followings.include?(customer)
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
end