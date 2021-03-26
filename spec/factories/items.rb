FactoryBot.define do
  factory :item do
    title                           {'机'}
    value                           {13000}
    description                     {'状態いいよーーー＾ー＾！'}
    delivery_id                     {3}
    place_id                        {4}
    how_long_id                     {2}
    category_id                     {3}
    status_id                       {3}

    association :user
  end

end
