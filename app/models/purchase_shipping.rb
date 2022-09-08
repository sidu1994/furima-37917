class PurchaseShipping

  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
  validates :post_code, presence: true , format: { with: /\A[0-9]+\z/ }
  validates :municipality, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :address, presence: true , format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } 
  validates :phone_number, presence: true , format: { with: /\A[0-9]+\z/ }
  validates :user_id
  validates :item_id
  validates :token
  end
  validates :building,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, allow_blank: true
  validates :area_id,  numericality: { other_than: 1, message: " can't be blank" }
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    
    Shipping.create(post_code: post_code, area_id: area_id , municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end

