require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    context '正常系' do
      it 'FactoryBotが機能しているのか' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do
 
      it'ニックネームが必須であること' do
        @user.nikename = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nikename can't be blank")
      end
  
      it'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
  
      it'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end
  
      it'メールアドレスは、@を含む必要があること' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end 
  
      it'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include  ("Password can't be blank")
      end

      it'パスワードが英語のみでは登録できないこと' do
        @user.password = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include  ("Password Include both letters and numbers")
      end
  
      it'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
        @user.password = '11111'
        @user.valid?
        
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
  
      it'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
        @user.password = '1111111'
        @user.valid?

        expect(@user.errors.full_messages).to include ("Password Include both letters and numbers")
      end
  
  
      it'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password_confirmation = 'bbb111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
  
    end
      
      describe'新規登録/本人情報確認' do
  
      it'ユーザー名は、名字が必須であること' do
        @user.fist_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Fist name can't be blank")
      end 
  
      it'ユーザー名は、名前が必須であること' do
        @user.list_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("List name can't be blank")
      end
  
      it'ユーザー名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.fist_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Fist name is invalid")
      end
  
      it'ユーザー名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.list_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include ("List name is invalid")
      end
  
      it'ユーザー名字のフリガナは必須であること' do
        @user.fist_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Fist name kana can't be blank")
      end
  
      it'ユーザー名前のフリガナは必須であること' do
        @user.list_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("List name kana can't be blank")
      end
  
      it'ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.fist_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Fist name kana is invalid")
      end
  
      it'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.list_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include ("List name kana is invalid")
      end

      it'ユーザー名字のフリガナは、カタカナ以外の全角文字だと登録できないこと' do
        @user.fist_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Fist name kana is invalid")
      end
  
      it'ユーザー名前のフリガナは、カタカナ以外の全角文字だと登録できないこと' do
        @user.list_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include ("List name kana is invalid")
      end


      it'生年月日が必須であること' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birth day can't be blank")
      end
    end
  end





end
