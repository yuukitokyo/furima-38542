require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do

  before do
    @order_delivery_address = FactoryBot.build(:order_delivery_address)
  end

  describe '購入情報の保存' do    
    context '保存できる場合' do
      it 'postal_code,delivery_area_id,city,block,building_name,phone_number,tokenがあれば保存できる' do
        expect(@order_delivery_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_delivery_address.building_name = ' '
        expect(@order_delivery_address).to be_valid
      end
    end

    context '保存できない場合' do
      it 'postal_codeが空だと保存できない' do
        @order_delivery_address.postal_code = ' '
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'delivery_area_idが空だと保存できない' do
        @order_delivery_address.delivery_area_id = ' '
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_delivery_address.city = ' '
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できない' do
        @order_delivery_address.block = ' '
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_delivery_address.phone_number = ' '
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと保存できない' do
        @order_delivery_address.token = ' '
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeは全角数字では保存できない' do
        @order_delivery_address.postal_code = '３３３-３３３３ '
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeは「3桁ハイフン4桁」でないと保存できない' do
        @order_delivery_address.postal_code = '333333'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'delivery_area_idで「---」が選択されていると保存できない' do
        @order_delivery_address.delivery_area_id = '1'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'phone_numberは全角数字だと保存できない' do
        @order_delivery_address.phone_number = '０１２３４５６７８９'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberはハイフンが含まれていると保存できない' do
        @order_delivery_address.phone_number = '01-2345-6789'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは9桁以下だと保存できない' do
        @order_delivery_address.phone_number = '012345678'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは12桁以上だと保存できない' do
        @order_delivery_address.phone_number = '012345678901'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end

#postal_code,delivery_area_id,city,block,building_name,phone_number  
