require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  let(:user) { FactoryBot.create(:user)}
  let(:item) { FactoryBot.create(:item, user_id: user.id)}

  before do
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    sleep 0.1 # データベースへの反映待ち時間
  end



  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      
      it 'building_nameは空でも保存できること' do
        @record_address.building_name = ""
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "userが紐付いていないと保存できない" do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
       end

      it "itemが紐付いていないと保存できない" do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
       end
      
      it 'postal_codeが空だと保存できないこと' do
        @record_address.postal_code = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'region_idが0だと保存できないこと' do
        @record_address.region_id = 0
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Region を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @record_address.city= ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @record_address.house_number = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @record_address.phone_number = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @record_address.token = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postal_code = "1111111"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code は「3桁ハイフン4桁」の半角文字列で入力してください")
      end
      
      it 'Phone_numberが半角数値以外だと保存できないこと' do
        @record_address.phone_number = "１１１１１１１１１１"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number は半角数値のみ入力してください")
      end
      it 'Phone_numberが9文字以下だとだと保存できないこと' do
        @record_address.phone_number ="00000"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'Phone_numberが12文字以下だとだと保存できないこと' do
        @record_address.phone_number ="000000000000"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
  
    end
  end
end

