require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "全項目入力すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが41文字以上だと登録できない" do
        @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end
      
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合、登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "苗字が空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "苗字のフリガナが空では登録できない" do
        @user.family_name_kata = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kata can't be blank")
      end
      it "名前のフリガナが空では登録できない" do
        @user.first_name_kata = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kata can't be blank")
      end
      it "生年月日が空では登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end

  end
end
