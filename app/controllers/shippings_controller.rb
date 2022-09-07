class ShippingsController < ApplicationController

  def index
  @item = Item.find(params[:item_id])
  @purchase_shipping = PurchaseShipping.new 
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(shipping_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      return redirect_to root_path
    else
      render   :index
    end
  end

  private

  def shipping_params
    params.require(:purchase_shipping).permit(:post_code,:area_id,:municipality,:address,:building,:phone_number  ).merge(user_id: current_user.id,item_id: @item.id )
  end
end

