require 'rails_helper'

RSpec.describe CreditOrder, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:credit_order)
    end

    it '全項目を入力していれば購入できる' do
      expect(@order).to be_valid
    end

    it '建物名が記入されてなくても購入できる' do
      @order.building = nil
      expect(@order).to be_valid
    end

    it 'ハイフンなしの7桁の郵便番号では購入できない' do
      @order.post_number = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("郵便番号をハイフンありで入力してください")
    end

    it '都道府県の項目を選択してないと購入できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("都道府県を選択してください")
    end

    it '市区町村の項目を記入していないと購入できない' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("市町村を入力してください")
    end

    it '番地の項目を記入していないと購入できない' do
      @order.street_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("番地を入力してください")
    end

    it '電話番号の項目を記入してないと購入できない' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("電話番号を入力してください", "電話番号をハイフンなしで入力してください")
    end

    it '11桁以上の電話番号では購入できない' do
      @order.phone_number = '090111122223'
      @order.valid?
      expect(@order.errors.full_messages).to include("電話番号をハイフンなしで入力してください")
    end

    it 'クレジット情報を正しく入力してないと購入できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
  end
end
