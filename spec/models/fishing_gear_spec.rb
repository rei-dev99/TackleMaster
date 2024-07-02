require 'rails_helper'

RSpec.describe FishingGear, type: :model do
  let(:fishing_gear) { build(:fishing_gear) }
  describe '提案の作成について' do
    context '提案できるとき' do
      it '提案が作成できること' do
        fishing_gear = build(:fishing_gear)
        expect(fishing_gear).to be_valid
        expect(fishing_gear.errors).to be_empty
      end
    end

    context '提案の作成ができないとき' do
      it 'fish_typeがないと無効であること' do
        task_without_fish_type = build(:fishing_gear, fish_type: "")
        expect(task_without_fish_type).to be_invalid
        expect(task_without_fish_type.errors[:fish_type]).to eq ["狙う魚を入力してください"]
      end
      it 'budgetがないと無効であること' do
        task_without_budget = build(:fishing_gear, budget: "")
        expect(task_without_budget).to be_invalid
        expect(task_without_budget.errors[:budget]).to eq ["予算を入力してください"]
      end
      it 'locationがないと無効であること' do
        task_without_location = build(:fishing_gear, location: "")
        expect(task_without_location).to be_invalid
        expect(task_without_location.errors[:location]).to eq ["釣りの場所を入力してください"]
      end
      it 'fishing_typeがないと無効であること' do
        task_without_fishing_type = build(:fishing_gear, fishing_type: "")
        expect(task_without_fishing_type).to be_invalid
        expect(task_without_fishing_type.errors[:fishing_type]).to eq ["釣りの種類を入力してください"]
      end
      it 'skill_levelがないと無効であること' do
        task_without_skill_level = build(:fishing_gear, skill_level: "")
        expect(task_without_skill_level).to be_invalid
        expect(task_without_skill_level.errors[:skill_level]).to eq ["釣りの経験レベルを入力してください"]
      end
      it 'tackle_typeがないと無効であること' do
        task_without_tackle_type = build(:fishing_gear, tackle_type: "")
        expect(task_without_tackle_type).to be_invalid
        expect(task_without_tackle_type.errors[:tackle_type]).to eq ["釣り具の種類を入力してください"]
      end
      it 'tackle_makerがないと無効であること' do
        task_without_tackle_maker = build(:fishing_gear, tackle_maker: "")
        expect(task_without_tackle_maker).to be_invalid
        expect(task_without_tackle_maker.errors[:tackle_maker]).to eq ["メーカーを入力してください"]
      end
    end
  end
end
