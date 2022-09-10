class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

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

  def edit

    redirect_to root_path if current_user != @item.user
    redirect_to root_path if @item.purchase.present?
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user == @item.user
    redirect_to root_path
  end

  private

  # 送るデータを設定
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :situation_id, :load_id, :area_id, :deadline_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
