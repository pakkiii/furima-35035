FactoryBot.define do
  factory :item do
    title                           { '机' }
    value                           { 13_000 }
    description                     { '状態いいよーーー＾ー＾！' }
    delivery_id                     { 3 }
    place_id                        { 4 }
    how_long_id                     { 2 }
    category_id                     { 3 }
    status_id                       { 3 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
