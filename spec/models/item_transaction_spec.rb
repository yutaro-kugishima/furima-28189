require 'rails_helper'

RSpec.describe ItemTransaction, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order = FactoryBot.build(:item_transaction,user_id: @user.id,item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
    context "商品購入ができる" do
      it "全ての値が正しく入力されていれば保存できること" do
      expect(@order).to be_valid
      end
    end

    context "商品購入ができない" do
      it "郵便番号が空では保存できないこと" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号がハイフンがないと保存できないこと" do
        @order.postal_code = '1234567' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "都道府県が空では保存できないこと" do
        @order.prefecture = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県が0の時は保存できないこと" do
        @order.prefecture = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "市区町村が空では保存できないこと" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では保存できないこと" do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it "建物は空でも保存される" do
        @order.building_name = nil
        expect(@order).to be_valid
      end
      it "電話番号が空では保存できないこと" do
        @order.telephone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "電話番号はハイフンがなく11桁以外では保存できないこと" do
        @order.telephone_number = '000111122222'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is the wrong length (should be 11 characters)")
      end
      it "tokenが空では保存できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end 
    end
  end
end
