class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :password, :presence => {:message => 'パスワードを入力してください'}
  
end
