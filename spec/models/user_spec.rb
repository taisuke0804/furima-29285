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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "nicknameが41文字以上だと登録できない" do
        @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームは40文字以内で入力してください")
      end
      
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合、登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに、@が含まれていないと登録できない" do
        @user.email = 'aaaaa.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
        @user.password = "bbbbbb"
        @user.password_confirmation = "bbbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを半角英数字混合6~20文字で入力してください")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードを半角英数字混合6~20文字で入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "000aa"
        @user.password_confirmation = "000aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードを半角英数字混合6~20文字で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "苗字が空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字を全角で入力してください")
      end
      it "苗字が全角でなければ登録できない" do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を全角で入力してください")
      end
      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前を全角で入力してください")
      end
      it "名前が全角でなければ登録できない" do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を全角で入力してください")
      end
      it "苗字のフリガナが空では登録できない" do
        @user.family_name_kata = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（フリガナ）を入力してください", "苗字（フリガナ）を全角カタカナで入力してください")
      end
      it "苗字のフリガナが全角カタカナでなければ登録できない" do
        @user.family_name_kata = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（フリガナ）を全角カタカナで入力してください")
      end
      it "名前のフリガナが空では登録できない" do
        @user.first_name_kata = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（フリガナ）を入力してください", "名前（フリガナ）を全角カタカナで入力してください")
      end
      it "名前のフリガナが全角カタカナでなければ登録できない" do
        @user.first_name_kata = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（フリガナ）を全角カタカナで入力してください")
      end
      it "生年月日が空では登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end

  end
end
