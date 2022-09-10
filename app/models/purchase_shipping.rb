class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true, format: { with: /\A[0-9]{10,11}+\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :area_id, numericality: { other_than: 1, message: " can't be blank" }
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Shipping.create(post_code: post_code, area_id: area_id, municipality: municipality, address: address, building: building,
                    phone_number: phone_number, purchase_id: purchase.id)
  end
end
