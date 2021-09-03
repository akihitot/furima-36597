require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入できる場合' do
      it '必須項目が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_shipping.post_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping.post_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @purchase_shipping.prefecture_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is invalid')
      end
      it 'prefecture_idが--だと保存できないこと' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Prefecture is invalid')
      end
      it 'cityが空だと保存できないこと' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @purchase_shipping.telephone = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9桁以下だと保存できないこと' do
        @purchase_shipping.telephone = '090123456'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが12桁以上だと保存できないこと' do
        @purchase_shipping.telephone = '090123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが全角数値だと保存できないこと' do
        @purchase_shipping.telephone = '０００００００００００'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが半角数値のみで入力されなければ保存できないこと' do
        @purchase_shipping.telephone = '000-0000-0000'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Telephone is invalid')
      end
      it 'userと紐付いていなければ購入できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐付いていなければ購入できない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
