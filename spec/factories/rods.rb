FactoryBot.define do
    factory :rod do
        name { "テストロッド" }
        after(:build) do |rod|
            rod.image.attach(io: File.open(Rails.root.join('spec/factories/test.jpg')), filename: 'test.jpg', content_type: 'image/jpg')
        end
        maker { "ダイソー" }
        association :tackle
    end
end
