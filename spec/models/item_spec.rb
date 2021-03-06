require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '必要情報を全て登録すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない' do
      it "画像が添付されてないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
        
      end

      it '商品の説明が空では出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end

      it 'カテゴリーが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が空では出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it '発送料の負担が空では出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end

      it '発送元の地域が空では出品できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end

      it '発送までの日数が空では出品できない' do
        @item.schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Schedule can't be blank"
      end

      it '販売価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '販売価格が300円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '販売価格が9999999円以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'ユーザーが空では出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

      it 'カテゴリーが--では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が--では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it '発送料の負担が--では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end

      it '発送元の地域が--では出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end

      it '発送までの日数が--では出品できない' do
        @item.schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Schedule can't be blank"
      end
    end
  end
end
