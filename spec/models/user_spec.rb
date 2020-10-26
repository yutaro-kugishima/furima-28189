require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "nicknameが空だと登録できない" do
      it (nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    context "名字が空だと登録できない" do
      it (nickname: "abe", first_name: "", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    context "名前が空だと登録できない" do
      it (nickname: "abe", last_name: "", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    context "名字（カナ）が空だと登録できない" do
      it (nickname: "abe", first_name_kana: "", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    context "名前（カナ）が空だと登録できない" do
      it (nickname: "abe", last_name_kana: "", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    context "誕生日が空だと登録できない" do
      it (nickname: "abe", birth_date: "", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
    context "passwordが空では登録できない" do
      it (nickname: "abe", email: "", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    context "password（確認）が空では登録できない" do
      it (nickname: "abe", email: "", password: "00000000", password_confirmation: "")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end