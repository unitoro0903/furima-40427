require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemailとpasswordとpassword_confirmationとfamily_name_kanjiとfirst_name_kanjiとfamily_name_kanaとfirst_name_kanaとbirthdayが存在する" do
        @user.family_name_kanji = "位"
        @user.first_name_kanji = "位"
        @user.family_name_kana = "ア"
        @user.first_name_kana = "ア"
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "family_name_kanjiが空では登録できない" do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end
      it "first_name_kanjiが空では登録できない" do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

        it '重複したemailが存在する場合は登録できない' do
          @user.family_name_kanji = "位"
         @user.first_name_kanji = "位"
         @user.family_name_kana = "ア"
         @user.first_name_kana = "ア"
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
  
       it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.family_name_kana = "亜"
        @user.first_name_kana = "亜"
        @user.family_name_kana = "ア"
        @user.first_name_kana = "ア"
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

        it '数字のみのパスワードでは登録できない' do
          @user.family_name_kana = "亜"
        @user.first_name_kana = "亜"
        @user.family_name_kana = "ア"
        @user.first_name_kana = "ア"
          @user.password = '123456'
        @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
        end

          it '全角文字を含むパスワードでは登録できない' do
            @user.family_name_kana = "亜"
            @user.first_name_kana = "亜"
            @user.family_name_kana = "ア"
            @user.first_name_kana = "ア"
            @user.password = 'ｒuby123'
          @user.password_confirmation = 'ｒuby123'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers', 'Password must not include full-width characters.')
          end

            it '姓（全角）に半角文字が含まれていると登録できない' do
            
              @user.first_name_kanji = "亜"
              @user.family_name_kana = "ア"
              @user.first_name_kana = "ア"
              @user.family_name_kanji = 'hankaku'
              @user.valid?
              expect(@user.errors.full_messages).to include('Family name kanji 全角文字を使用してください')
            end

            it '名（全角）に半角文字が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              @user.family_name_kana = "ア"
              @user.first_name_kana = "ア"
              @user.first_name_kanji = 'hankaku'
              @user.valid?
              expect(@user.errors.full_messages).to include('First name kanji 全角文字を使用してください')
            end

            it '姓（カナ）にカタカナ以外の平仮名が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              @user.first_name_kana = "ア"
              @user.first_name_kanji = '亜'
              @user.family_name_kana = 'ひらがな'
              @user.valid?
              expect(@user.errors.full_messages).to include('Family name kana はカタカナで入力して下さい。')
            end

            it '名（カナ）にカタカナ以外の平仮名が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              @user.family_name_kana = "ア"
             
              @user.first_name_kanji = '亜'
              @user.first_name_kana = 'ひらがな'
              @user.valid?
              expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
            end

            it '姓（カナ）にカタカナ以外の漢字が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              
              @user.first_name_kana = "ア"
              @user.first_name_kanji = '亜'
              @user.family_name_kana = '漢字'
              @user.valid?
              expect(@user.errors.full_messages).to include('Family name kana はカタカナで入力して下さい。')
            end

            it '名（カナ）にカタカナ以外の漢字が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              
              @user.family_name_kana = "ア"
              
              @user.first_name_kanji = '亜'
              @user.first_name_kana = '漢字'
              @user.valid?
              expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
            end

            it '姓（カナ）にカタカナ以外の英数字が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              
              
              @user.first_name_kana = "ア"
              @user.first_name_kanji = '亜'
              @user.family_name_kana = 'アeisuuji1'
              @user.valid?
              expect(@user.errors.full_messages).to include('Family name kana はカタカナで入力して下さい。')
            end

            it '名（カナ）にカタカナ以外の英数字が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              
              @user.family_name_kana = "ア"
              
              @user.first_name_kanji = '亜'
              @user.first_name_kana = 'アeisuuji1'
              @user.valid?
              expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
            end

            it '姓（カナ）にカタカナ以外の記号が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              
              
              @user.first_name_kana = "ア"
              @user.first_name_kanji = '亜'
              @user.family_name_kana = '＠'
              @user.valid?
              expect(@user.errors.full_messages).to include('Family name kana はカタカナで入力して下さい。')
            end

            it '名（カナ）にカタカナ以外の記号が含まれていると登録できない' do
              @user.family_name_kanji = "亜"
              
              @user.family_name_kana = "ア"
              
              @user.first_name_kanji = '亜'
              @user.first_name_kana = '＠'
              @user.valid?
              expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
            end
            
            
    end
  end
end
