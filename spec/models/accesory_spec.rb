require 'rails_helper'

RSpec.describe Accesory, type: :model do
  let(:accesory) { build(:accesory) }

  describe '小物作成について' do
    context '小物が作成できるとき' do
      it '小物が作成できること' do
        expect(accesory).to be_valid
        expect(accesory.errors).to be_empty
      end
    end

    context '小物の作成ができないとき' do
      it '名前がないと無効であること' do
        accesory = build(:accesory, name: "")
        expect(accesory.errors.full_messages).to be_invalid
        expect(accesory.errors.full_messages).to include("小物名を入力してください")
      end

      it '画像がないと無効であること' do
        accesory = build(:accesory, image: "")
        expect(accesory.errors.full_messages).to be_invalid
        expect(accesory.errors.full_messages).to include("画像をアップロードしてください")
      end
    end
  end
end
