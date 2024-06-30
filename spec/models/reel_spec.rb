require 'rails_helper'

RSpec.describe Reel, type: :model do
  let(:reel) { build(:reel) }

  describe 'リール作成について' do
    context 'リールが作成できるとき' do
      it 'リールが作成できること' do
        expect(reel).to be_valid
        expect(reel.errors).to be_empty
      end
    end

    context 'リールの作成ができないとき' do
      it '名前がないと無効であること' do
        reel = build(:reel, name: "")
        expect(reel.errors.full_messages).to be_invalid
        expect(reel.errors.full_messages).to include("リール名を入力してください")
      end

      it '画像がないと無効であること' do
        reel = build(:reel, image: "")
        expect(reel.errors.full_messages).to be_invalid
        expect(reel.errors.full_messages).to include("画像をアップロードしてください")
      end
    end
  end
end
