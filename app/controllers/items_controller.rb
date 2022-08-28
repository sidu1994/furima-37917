class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]

  def index
    @items = Item.all.order(created_at: :desc)

  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  private

  # 送るデータを設定
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :situation_id, :load_id, :area_id, :deadline_id,
                                 :price).merge(user_id: current_user.id)
  end
end
