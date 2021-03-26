require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do

    context '正常系' do
      it '全ての情報が指定された内容通り存在すれば登録できる' do
        expect(@item).to be_valid
      end


    end


    context '異常系' do

      it '商品名が空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")

      end

      it '価格を入力していないと出品できない' do
        @item.value = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end

      it '価格は300円以下では出品できない' do
        @item.value = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Value must be greater than or equal to 300")
      end

      it '価格は10000000円以上では出品できない' do
        @item.value = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Value must be less than or equal to 9999999")
      end

      it '価格は全角文字では出品できない' do
        @item.value = '１４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include("Value is not a number")
      end

      it '価格は半角英数混合では出品できない' do
        @item.value = '1345ad'
        @item.valid?
        expect(@item.errors.full_messages).to include("Value is not a number")
      end

      it '価格は半角英語だけでは出品できない' do
        @item.value = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include("Value is not a number")
      end




      it '配送料の負担を選択していないと出品できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it '発送元の地域を選択していないと出品できない' do
        @item.place_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Place must be other than 0")
      end

      it '発送までの日数を選択していないと出品できない' do
        @item.how_long_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("How long must be other than 1")
      end

      it 'カテゴリーを選択していないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態を選択していないと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")

      end

    end

  end
  #pending "add some examples to (or delete) #{__FILE__}"
end
