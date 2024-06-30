FactoryBot.define do
  factory :fishing_gear do
    fish_type { "マグロ" }
    budget { "30万円" }
    location { "船" }
    fishing_type { "船釣り" }
    tackle_type { "タックル一式" }
    tackle_maker { "シマノ" }
    skill_level { "初心者" }
    association :user
  end
end
