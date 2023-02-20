require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できるとき" do
      it "商品画像、商品名、商品情報、商品カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば保存される" do
       expect(@item).to be_valid
      end
    end

    context "商品が保存できない場合" do  
      it "imageがなければ保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameがなければ保存できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end     
      it "item_descriptionがなければ保存できない" do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end     
      it "item_category_idがなければ保存できない" do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end     
      it "item_state_idがなければ保存できない" do
        @item.item_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end     
      it "delivery_burden_idがなければ保存できない" do
        @item.delivery_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end     
      it "delivery_area_idがなければ保存できない" do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end     
      it "delivery_day_idがなければ保存できない" do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end   
      it "item_priceがなければ保存できない" do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it "item_priceは半角数字でないと保存できない" do
        @item.item_price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "item_priceは¥300以下だと保存できない" do
        @item.item_price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it "item_priceは¥9,999,999以上だと保存できない" do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'item_categoryで「---」が選択されていると保存できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_stateで「---」が選択されていると保存できない' do
        @item.item_state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end     
      it 'delivery_burdenで「---」が選択されていると保存できない' do
        @item.delivery_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end   
      it 'delivery_areaで「---」が選択されていると保存できない' do
        @item.delivery_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end   
      it 'delivery_dayで「---」が選択されていると保存できない' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end    
      it 'item_priceは小数では保存できない' do
        @item.item_price = '0.1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be an integer")
      end
    end
  end

end




# item_name,item_description ,item_category_id ,item_state_id,delivery_burden_id ,delivery_area_id,delivery_day_id,item_price ,user  