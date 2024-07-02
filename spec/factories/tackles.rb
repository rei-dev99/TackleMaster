FactoryBot.define do
    factory :tackle do
        name { "テストタックルメニュー" }
        after(:build) do |tackle|
            tackle.image.attach(io: File.open(Rails.root.join('spec/fixtures/test.jpg')), filename: 'test.jpg', content_type: 'image/jpg')
        end
        association :user
    end
end
