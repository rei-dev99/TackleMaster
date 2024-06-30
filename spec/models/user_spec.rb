require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) } ## factories>user.rbのオブジェクト生成

  describe 'ユーザー新規登録' do
    context '登録ができるとき' do
      it '全ての項目が正しく入力されている時' do
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end
    end
    context '登録ができないとき' do
      it 'nameが空では登録できない' do
        user = build(:user, name: "")
        expect(user.errors.full_messages).to be_invalid
        expect(user.errors.full_messages).to include("名前を入力してください")
      end
      it 'emailが空では登録できない' do
        user = build(:user, email: "")
        expect(user.errors.full_messages).to be_invalid
        expect(user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'passwordが空では登録できない' do
        user = build(:user, password: "")
        expect(user.errors.full_messages).to be_invalid
        expect(user.errors.full_messages).to include("パスワードは3文字以上で入力してください")
      end
      it 'passwordが3文字未満では登録できない' do
        user = build(:user, password: "ab")
        expect(user.errors.full_messages).to be_invalid
        expect(user.errors.full_messages).to include("パスワードは3文字以上で入力してください")
      end
      it 'password_confirmationが空では登録できない' do
        user = build(:user, password_confirmation: "")
        expect(user.errors.full_messages).to be_invalid
        expect(user.errors.full_messages).to include("パスワード確認を入力してください")
      end
    end
  end

  describe 'ログイン' do
    context 'ログインができるとき' do
        it 'ログイン成功' do
            user = User.create(email: "tackle@gmail.com", password: "password")
            expect(user).to be_valid
        end
    end
    context 'ログイン失敗' do
        it 'emailが空' do
            user = build(:user, email: "")
            expect(user.errors.full_messages).to be_invalid
            expect(user.errors.full_messages).to include("メールアドレスを入力してください")
        end
        it 'passwordが空' do
            user = build(:user, password: "")
            expect(user.errors.full_messages).to be_invalid
            expect(user.errors.full_messages).to include("パスワードは3文字以上で入力してください")
        end
    end
  end
end
