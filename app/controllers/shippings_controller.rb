class ShippingsController < ApplicationController

  def index
  @item = Item.find(params[:item_id])

  end

  def create
    @shipping = Shipping.new(shippng_params)
    if @shipping.valid?
      @shipping.save
      return redirect_to root_path
    else
      render shipping_path
    end
  end

  private

  def shipping_params
    params.require(:shipping).permit(:post_code,:area_id,:municipality,:address,:building,:phone_number).merge(user_id: current_user.id, purchase_id: purchase.id)
  end
end

