require 'rails_helper'

RSpec.describe Rod, type: :model do
  let(:rod) { build(:rod) }

  describe 'ロッド作成について' do
    context 'ロッドが作成できるとき' do
      it 'ロッドが作成できること' do
        expect(rod).to be_valid
        expect(rod.errors).to be_empty
      end
    end

    context 'ロッドの作成ができないとき' do
      it '名前がないと無効であること' do
        rod = build(:rod, name: "")
        expect(rod.errors.full_messages).to be_invalid
        expect(rod.errors.full_messages).to include("ロッド名を入力してください")
    end
    
    it '画像がないと無効であること' do
        rod = build(:rod, image: "")
        expect(rod.errors.full_messages).to be_invalid
        expect(rod.errors.full_messages).to include("画像をアップロードしてください")
      end
    end
end
