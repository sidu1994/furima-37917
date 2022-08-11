class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :last_name_kannzi,format: { with: /\A[一-龥ぁ-ん]/}
         validates :first_name_kannzi, format: { with: /\A[一-龥ぁ-ん]/}
         validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ } 
         validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ } 

       
end
