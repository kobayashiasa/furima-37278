require 'rails_helper'

RSpec.describe OrderShippingInfo, type: :model do
  describe '発送先情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_shipping_info = FactoryBot.build(:order_shipping_info, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_info).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipping_info.building = ''
        expect(@order_shipping_info).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと保存できないこと' do
        @order_shipping_info.zip_code = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_info.zip_code = 10000000
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_shipping_info.prefecture_id = 1
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping_info.city = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_shipping_info.address = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_shipping_info.phone = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order_shipping_info.phone = '１２３４５６７８９０'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include('Phone is not a number')
      end
      it 'phoneが英字だと保存できないこと' do
        @order_shipping_info.phone = 'abcdefghij'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include('Phone is not a number')
      end
      it 'phoneが短いと保存できないこと' do
        @order_shipping_info.phone = 123456789
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
      end
      it 'phoneが長いと保存できないこと' do
        @order_shipping_info.phone = 123456789012
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it 'userが紐づかないと保存できないこと' do
        @order_shipping_info.user_id = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づかないと保存できないこと' do
        @order_shipping_info.item_id = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenがないと保存できないこと' do
        @order_shipping_info.token = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end