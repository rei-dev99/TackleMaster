FactoryBot.define do
  factory :fishing_gear do
    fish_type { "MyString" }
    budget { "MyString" }
    location { "MyString" }
    fishing_type { "MyString" }
    tackle_type { "MyString" }
    tackle_maker { "MyString" }
    skill_level { "MyString" }
    memo { "MyText" }
    suggestion { "MyText" }
    user { nil }
  end
end
