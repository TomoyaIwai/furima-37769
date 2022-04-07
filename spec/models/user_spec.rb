require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'nickname、email、password、password_confirmation、last_name、first_name、
        last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できる' do
          @user.password = 'ttt666'
          @user.password_confirmation = 'ttt666'
          expect(@user).to be_valid
        end
      end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = '111a'
        @user.password_confirmation = '111a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'eeeeee'
        @user.password_confirmation = 'eeeeee'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password パスワードは半角英数字混合で6文字以上含む必要があります"
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '555555'
        @user.password_confirmation = '555555'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password パスワードは半角英数字混合で6文字以上含む必要があります"
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '555５５５'
        @user.password_confirmation = '555５５５'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password パスワードは半角英数字混合で6文字以上含む必要があります"
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '555eee'
        @user.password_confirmation = '454eee'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'hoge谷'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'huga平'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'hoge谷'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カタカナを使用してください"
      end

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'huga平'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カタカナを使用してください"
      end
    end
  end
end