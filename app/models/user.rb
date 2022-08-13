class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :last_name_kannzi,format: { with: /\A[一-龥ぁ-ん]/}, presence: true
         validates :first_name_kannzi, format: { with: /\A[一-龥ぁ-ん]/}, presence: true
         validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ } ,  presence: true
         validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ } , presence: true
         validates :birthday, presence: true

       
end
