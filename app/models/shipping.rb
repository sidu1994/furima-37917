class Shipping < ApplicationRecord
  belongs_to :purchases


  validates :post_code, presence: true , format: { with: /\A[0-9]+\z/ }
  validates :area_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :address, presence: true , format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :building,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } 
  validates :phone_number, presence: true , format: { with: /\A[0-9]+\z/ }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
