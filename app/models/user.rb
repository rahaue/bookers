class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # モデルマイグレートする前に関連付る
  has_many :books
  
  # refileを使って画像投稿の機能を実装します
  attachment :profile_image
end
