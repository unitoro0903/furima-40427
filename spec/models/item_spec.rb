require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it "userとimageとtitleとexplanationとcategory_idとcondition_idとship_fee_idとregion_idとrequire_time_idとpriceが存在する" do
       
        expect(@item).to be_valid
        end
      end
      context '新規登録できない場合' do
        it "userが紐付いていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
        end
     
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "titleが空では登録できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "explanationが空では登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      
      it "category_idが0では登録できない" do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが0では登録できない" do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "ship_fee_idが0では登録できない" do
        @item.ship_fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship fee can't be blank")
      end
      it "region_idが0では登録できない" do
        @item.region_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it "require_time_idが0では登録できない" do
        @item.require_time_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Require time can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角では数字と判定されず登録できない" do
        @item.price = '１４００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
