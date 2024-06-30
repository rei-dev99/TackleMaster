require 'rails_helper'

RSpec.describe Tackle, type: :model do
  let(:tackle) { build(:tackle) }

  describe 'タックル作成について' do
    context 'タックルが作成できるとき' do
      it 'タックルが作成できること' do
        expect(tackle).to be_valid
        expect(tackle.errors).to be_empty
      end
    end

    context 'タックルの作成ができないとき' do
      it '名前がないと無効であること' do
        tackle = build(:tackle, name: "")
        expect(tackle.errors.full_messages).to be_invalid
        expect(tackle.errors.full_messages).to include("タックル名を入力してください")
      end

      it '画像がないと無効であること' do
        tackle = build(:tackle, image: "")
        expect(tackle.errors.full_messages).to be_invalid
        expect(tackle.errors.full_messages).to include("画像をアップロードしてください")
      end
    end
end
