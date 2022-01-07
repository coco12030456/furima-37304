require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが半角文字列でないと保存できないこと' do
        @order_destination.post_code = '１２３-４５６７'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を正しく入力してください※ハイフン(-)を含む")
      end
      it 'post_codeが前半3桁でないと保存できないこと' do
        @order_destination.post_code = '1234-1234'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を正しく入力してください※ハイフン(-)を含む")
      end
      it 'post_codeが後半4桁でないと保存できないこと' do
        @order_destination.post_code = '123-12345'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を正しく入力してください※ハイフン(-)を含む")
      end
      it 'post_codeがハイフンがないと保存できないこと' do
        @order_destination.post_code = '1231234'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を正しく入力してください※ハイフン(-)を含む")
      end
      it 'area_idが---だと保存できないこと' do
        @order_destination.area_id = '1'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空だと保存できないこと' do
        @order_destination.block = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが９桁以内だと保存できないこと'do
        @order_destination.phone_number = '12345678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが12桁以上だと保存できないこと'do
        @order_destination.phone_number = '123456789012'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが数値以外だと保存できないこと'do
        @order_destination.phone_number = '090-1234-5678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが全角数値だと保存できないこと'do
        @order_destination.phone_number = '０９０１２３４５６７８'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
