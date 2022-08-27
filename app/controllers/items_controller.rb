class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.all.order(created_at: :desc)
    @purchases = Purchase.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else

      render :new
    end
  end

  private

  # 送るデータを設定
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :situation_id, :load_id, :area_id, :deadline_id,
                                 :price).merge(user_id: current_user.id)
  end
end
