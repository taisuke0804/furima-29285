require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end
  
    it '全項目を入力していれば保存できる' do
      expect(@item).to be_valid
    end
    it '商品名が空では出品できない' do
      @item.item = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品名が41文字以上では出品できない' do
      @item.item = "あああああああああああああああああああああああああああああああああああああああああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
    end
    it '商品説明が空では出品できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品説明を入力してください")
    end
    it '商品説明が1001文字以上では出品できない' do
      @item.explanation = "a" * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("商品説明は1000文字以内で入力してください")
    end
    it 'カテゴリを選択してないと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it '商品の状態を選択していないと出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end
    it '配送料負担項目を選択してないと出品できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
    end
    it '発送元地域の項目を選択してないと出品できない' do
      @item.sending_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end
    it '発送日数の項目を選択していないと出品できない' do
      @item.sending_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end
    it '販売価格が空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は数値で入力してください")
    end
    it '販売価格299円以下では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は299より大きい値にしてください")
    end
    it '販売価格が10000000円以上では出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は10000000より小さい値にしてください")
    end
  end
end
