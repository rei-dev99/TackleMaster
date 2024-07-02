FactoryBot.define do
  factory :accesory do
    name { "テスト小物" }
      after(:build) do |accesory|
          accesory.image.attach(io: File.open(Rails.root.join('spec/factories/test.jpg')), filename: 'test.jpg', content_type: 'image/jpg')
      end
      maker { "ダイソー" }
      association :tackle
  end
end
