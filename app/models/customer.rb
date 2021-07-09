class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum conutry: { 県民: 0, 移住に興味のある方: 1 }
  
  attachment :image
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
end