require 'rails_helper'

RSpec.describe ItemTransaction, type: :model do
  before do
    @order = FactoryBot.build(:item_transaction)
  end

  it "記入に不備がなければ保存できること"
  expect(@order).to be_valid?
  end

  it "郵便番号が空では保存できないこと" do
    @order.postal_code = nil
    @order.be_valid?
    expect(@order.errors.full_messages).to include("Postal_code can't be blank")
  end
  it "都道府県が空では保存できないこと" do
    @order.prefecture = nil
    @order.be_valid?
    expect(@order.errors.full_messages).to include("Prefecture can't be blank")
  end
  it "市区町村が空では保存できないこと" do
    @order.city = nil
    @order.be_valid?
    expect(@order.errors.full_messages).to include("City can't be blank")
  end
  it "番地が空では保存できないこと" do
    @order.house_number = nil
    @order.be_valid?
    expect(@order.errors.full_messages).to include("House_number can't be blank")
  end
  it "電話番号が空では保存できないこと" do
    @order.telephone_number = nil
    @order.be_valid?
    expect(@order.errors.full_messages).to include("Telephone_number can't be blank")
  end
  it "郵便番号がハイフンがないと保存できbないこと" do
    @order.postal_code = 
    @order.be_valid?
    expect(@order.errors.full_messages).to include("Postal_code ")
  end
  it "電話番号はハイフンがなく11桁以外では保存できないこと" do
    @order.telephone_number = 
    @order.be_valid?
    expect(@order.errors.full_messages).to include("Telephone_number" )
  end
  
end
