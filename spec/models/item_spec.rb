require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context'出品できる時'do
    it 'カラムが全て埋まっているとき'do
    @item.valid?
    end
  end
  context'出品できないとき'do
    it'商品名が空だと登録できない'do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include"Name can't be blank"
    end
    it'商品説明が空だと登録できない'do
    @item.explanation = ''
    @item.valid?
    expect(@item.errors.full_messages).to include"Explanation can't be blank"
    end
    it'カテゴリーが空と登録できない'do
    @item.category_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include"Category can't be blank"
    end
    it'商品状態が空だと登録できない'do
    @item.situation_id= '1'
    @item.valid?
    expect(@item.errors.full_messages).to include"Situation can't be blank"
    end
    it'配送料の負担が空だと登録できない'do
    @item.load_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include"Load can't be blank"
    end
    it'配送元の地域が空だと登録できない'do
    @item.area_id  = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include"Area can't be blank"
    end
    it'配送までの日数が空だと登録できない'do
    @item.deadline_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include"Deadline can't be blank"
    end
    it'価格が空だと登録でいない'do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include"Price can't be blank"
    end
    it'価格が全角だと登録できない'do
    @item.price= '３００0'
    @item.valid?
    expect(@item.errors.full_messages).to include"Price is not a number"
    end
    it'価格が300以下だと登録できない'do
    @item.price= '299'
    @item.valid?
    expect(@item.errors.full_messages).to include"Price must be greater than or equal to 300"
    end
    it'価格が9999999以上だと登録できない'do
    @item.price= '10000000'
    @item.valid?
    expect(@item.errors.full_messages).to include"Price must be less than or equal to 9999999"
    end
  end
end
