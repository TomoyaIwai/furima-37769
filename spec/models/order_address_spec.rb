require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  describe '商品購入機能' do
    context '商品購入できる時' do
      it '必要情報を全て入力すれば登録できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できない' do
      it "カード情報を入力しなければ購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end

      it "郵便番号を入力しなければ購入できない" do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it "郵便番号にハイフンがなければ購入できない" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it "発送先の都道府県を選択しなければ購入できない" do
        @order_address.region_id = "1"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Region can't be blank"
      end

      it "発送先の市区町村を入力しなければ購入できない" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it "発送先の番地を入力しなければ購入できない" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end

      it "電話番号を入力しなければ購入できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it "電話番号が全角数字では購入できない" do
        @order_address.phone_number = "０９０８５７４６３７２"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it "電話番号が10桁未満では購入できない" do
        @order_address.phone_number = "090999999"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it "電話番号が11桁より多いと購入できない" do
        @order_address.phone_number = "090999999999999"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end

      it "user_idが紐づいていないと購入できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end

      it "item_idが紐づいていないと購入できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end