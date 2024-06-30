FactoryBot.define do
    factory :reel do
        name { "テストリール" }
        after(:build) do |reel|
            reel.image.attach(io: File.open(Rails.root.join('spec/factories/test.jpg')), filename: 'test.jpg', content_type: 'image/jpg')
        end
        maker { "ダイソー" }
        association :tackle
    end
end
