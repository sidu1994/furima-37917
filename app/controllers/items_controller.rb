class ItemsController < ApplicationController
  
  def index
  end
 
  def new
    unless user_signed_in?
      redirect_to new_user_session_path
      else
    @item = Item.new
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
  #送るデータを設定
  def item_params
    params.require(:item).permit(:name,:explanation ,:category_id ,:situation_id ,:load_id ,:area_id, :deadline_id ,:price ).merge(user_id: current_user.id)
  end
end

