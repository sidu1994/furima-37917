require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録できる時' do
    it 'カラムが全部埋められている場合' do
      @user.valid?
    end
  end
  context '新規登録できない時' do
    describe 'ユーザー新規登録' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password"
      end
      it 'last_name_kannziが空だと登録できない' do
        @user.last_name_kannzi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kannzi is invalid'
      end
      it 'first_name_kannziが空だと登録できない' do
        @user.first_name_kannzi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kannzi is invalid'
      end
      it 'last_name_katakanaが空だと登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name katakana is invalid'
      end
      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name katakana is invalid'
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あbcdef'
        @user.password_confirmation = 'あbcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name_kannzi = 'てtestすと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kannzi is invalid'
      end
      it '・名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name_kannzi = 'てtestすと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kannzi is invalid'
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_katakana = 'し試験１φ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name katakana is invalid'
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_katakana = 'し試験１φ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name katakana is invalid'
      end
    end
  end
end
