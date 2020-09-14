require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do

    it "画像、商品名、商品の説明、カテゴリー、商品の状態、配送料負担者、発送元の地域、発送までの日数、価格が存在すれば登録できる" do
      expect(@item).to be_valid
    end

    it "画像が空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が空では登録できない" do
      @item.introduction = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it "カテゴリーが空では登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態が空では登録できない" do
      @item.trading_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Trading status can't be blank")
    end

    it "配送料の負担者が空では登録できない" do
      @item.postage_payer_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer can't be blank")
    end

    it "発送元の地域が空では登録できない" do
      @item.prefecture_code_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture code can't be blank")
    end

    it "発送までの日数が空では登録できない" do
      @item.preparation_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation day can't be blank")
    end

    it "価格が空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が¥300未満だと登録できない" do
      @item.price = "20"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it "価格が¥9,999,999より高いと登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it "価格は半角数字でないと登録できない" do
      @item.price = "２０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "カテゴリーのidが1だと登録できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態のidが1だと登録できない" do
      @item.trading_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Trading status must be other than 1")
    end

    it "配送料の負担者のidが1だと登録できない" do
      @item.postage_payer_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
    end

    it "発送元の地域のidが1だと登録できない" do
      @item.prefecture_code_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture code must be other than 1")
    end

    it "発送までの日数のidが1だと登録できない" do
      @item.preparation_day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation day must be other than 1")
    end

  end
end
