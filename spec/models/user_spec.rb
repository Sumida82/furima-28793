require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it "nameとemail、password、password_confirmation、名前、苗字、名前カナ、苗字カナ、生年月日が存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "passwordが6文字以上であれば登録できる" do
      @user.password = "000aaaa"
      @user.password_confirmation = "000aaaa"
      expect(@user).to be_valid
    end

    it "nameが空だと登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが@を含んでいないと登録できない" do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できない" do
      @user.password = "000aa"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードは半角英数字混合でないと登録できない" do
      @user.password = "1234567"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

  end

  describe '本人情報確認' do
    
    it "ユーザー本名の苗字と名前がそれぞれ存在しなければ登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "abe"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "ユーザー本名の苗字と名前のフリガナがそれぞれ存在しなければ登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "ゆうた"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "生年月日が空だと登録できない" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

  end
end
