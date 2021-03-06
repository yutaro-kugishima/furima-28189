require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "新規登録ができる" do
      it "データに不備がなければ登録できる" do
        @user.valid?
        expect(@user).to be_valid
      end
    end
    
    context "新規登録ができない" do
      it "ニックネームが空である" do
        @user.nickname=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "名字が空だと登録できない" do
        @user.first_name=""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it "名前が空だと登録できない" do
        @user.last_name=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名字（カナ）が空だと登録できない" do
        @user.first_name_kana=""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名前（カナ）が空だと登録できない" do
        @user.last_name_kana=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "誕生日が空だと登録できない" do
        @user.birth_date=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password（確認）が空では登録できない" do
        @user.password_confirmation=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字が全角以外では登録できない" do
        @user.first_name="aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "名前が全角以外では登録できない" do
        @user.last_name="bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "名字（カナ）がカタカナ以外では登録できない" do
        @user.first_name_kana="ccc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字（カナ）を使用してください")
      end
      it "名前（カナ）がカタカナ以外では登録できない" do
        @user.last_name_kana="ddd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角文字（カナ）を使用してください")
      end
      it "emailが空では登録できないこと" do
        @user.email= ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複するemailが存在する場合に登録ができない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれない場合に登録できない" do
        @user.email = "testgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが英字のみの場合に登録ができない" do
        @user.password = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 6文字以上にしてください")
      end
      it "passwordが数字のみの場合に登録ができない" do
        @user.password = "11111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 6文字以上にしてください")
      end
    end
  end
end