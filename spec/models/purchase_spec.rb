require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '#create' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    it '全項目を入力していれば保存できる' do
      expect(@purchase).to be_valid
    end

    it 'post_number 12345678' do
      @purchase.post_number = 1234567
      @purchase.valid?
      binding.pry
    end
  end
end
