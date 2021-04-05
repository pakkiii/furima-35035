require 'rails_helper'

RSpec.describe BuyCustomer, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_customer = FactoryBot.build(:buy_customer, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_customer).to be_valid
      end

      it '建物名が抜けていても保存できること' do
        @buy_customer.build_name = ''
        expect(@buy_customer).to be_valid
      end


    end

    context '内容に問題がある場合' do

      it 'user_idが空だと保存できないこと' do
        @buy_customer.user_id = nil
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @buy_customer.item_id = nil
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @buy_customer.postal_code = ''
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが無いと保存できないこと' do
        @buy_customer.postal_code = '3337645'
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end


      it 'クレジットカードの情報を入力が空だと保存できないこと' do
        @buy_customer.postal_code = ''
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Postal code can't be blank")
      end



      it '都道府県が選択されていないと保存できないこと' do
        @buy_customer.place_id = 0
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Place must be other than 0")
      end

      it '市区町村が空だと保存できないこと' do
        @buy_customer.municipalities = ''
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @buy_customer.address = ''
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @buy_customer.tel_number = ''
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Tel number can't be blank")
      end


      it '電話番号は12桁以上では保存できないこと' do
        @buy_customer.tel_number = '123456789075'
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Tel number is too long (maximum is 11 characters)")
      end

      it '電話番号は英数字混合では保存できないこと' do
        @buy_customer.tel_number = '1234567abcd'
        @buy_customer.valid?
        expect(@buy_customer.errors.full_messages).to include("Tel number is not a number")
      end
      
      
    end
  end
end
