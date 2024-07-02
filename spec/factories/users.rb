FactoryBot.define do
    factory :user do
        name { "オーナーくん" }
        sequence(:email) { |n| "tackle_#{n}@example.com" }
        password {"password"}
        password_confirmation {"password"}
    end
end
