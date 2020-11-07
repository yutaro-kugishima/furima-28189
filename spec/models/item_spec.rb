require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id: @user.id)
  end

  describe '商品出品' do
    context "出品ができる" do
      it "データに不備がなければ出品できる" do
        @item.valid?
        expect(@item).to be_valid
      end
    end
    
    context "出品ができない" do
      it "商品画像が空である" do
        @item.image=nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空である" do
        @item.list=""
        @item.valid?
        expect(@item.errors.full_messages).to include("List can't be blank")
      end
      it "商品の説明が空である" do
        @item.detail=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank") 
      end
      it "カテゴリーが空である" do
        @item.category_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank") 
      end
      it "商品の状態が空である" do
        @item.status_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank") 
      end
      it "配送料の負担が空である" do
        @item.fee_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank") 
      end
      it "発送元の地域が空である" do
        @item.delivery_place_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery place can't be blank") 
      end
      it "発送までの日数が空である" do
        @item.delivery_days_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank") 
      end
      it "価格が半角数字以外では登録できない" do
        @item.price="aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を使用してください")
      end
      it "価格は¥300~9,999,999の間でないと登録できない" do
        @item.price=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300以上9999999以下で入力してください")
      end
      it "¥299以下では出品できない" do
        @item.price="299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300以上9999999以下で入力してください")
      end
      it "¥10000000円以上であれば出品できない" do
        @item.price="10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300以上9999999以下で入力してください")
      end
      it "カテゴリーが「--」の時は出品できない" do
        @item.category_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1") 
      end
      it "商品の状態が「--」の時は出品できない" do
        @item.status_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1") 
      end
      it "配送料の負担が「--」の時は出品できない" do
        @item.fee_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1") 
      end
      it "発送元の地域が「--」の時は出品できない" do
        @item.delivery_place_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery place must be other than 1") 
      end
      it "発送までの日数が「--」の時は出品できない" do
        @item.delivery_days_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1") 
      end
    end
  end
end