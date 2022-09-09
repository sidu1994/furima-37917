class ShippingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(shipping_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_params
    params.require(:purchase_shipping).permit(:post_code, :area_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: shipping_params[:token],
      currency: 'jpy'
    )
  end
end
