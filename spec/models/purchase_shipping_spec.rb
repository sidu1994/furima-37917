require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: item.user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'データ全てが正しければあれば保存ができること' do
      expect(@purchase_shipping).to be_valid
    end
    it '建物名が空白でも購入できる' do
      @purchase_shipping.building = nil
      expect(@purchase_shipping).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できない' do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では保存ができないこと' do
      @purchase_shipping.post_code = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank",
                                                                 'Post code is invalid. Include hyphen(-)')
    end
    it '郵便番号にハイフンが入っていないと保存できない' do
      @purchase_shipping.post_code = '1234567'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it '半角数字でないと保存が出来ない' do
      @purchase_shipping.post_code = '１２３-４５６７'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it '都道府県が選択されていないと保存ができない' do
      @purchase_shipping.area_id = '1'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Area  can't be blank")
    end
    it '市町村が空では保存ができないこと' do
      @purchase_shipping.municipality = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空では保存できない' do
      @purchase_shipping.address = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空では保存ができない' do
      @purchase_shipping.phone_number = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は10桁以上11桁以内でないと保存できない10桁未満の場合' do
      @purchase_shipping.phone_number = '00'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は10桁以上11桁以内でないと保存できない11桁以上の場合' do
      @purchase_shipping.phone_number = '000000000000000'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号に半角数字以外が含まれていると登録できない' do
      @purchase_shipping.phone_number = '00０１２３４５６７８'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
    end
    it 'userが紐付いていないと保存できないこと' do
      @purchase_shipping.user_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @purchase_shipping.item_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end
  end
end
