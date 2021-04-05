FactoryBot.define do
  factory :buy_customer do
    postal_code               {'123-4567'}
    place_id                  { 3 }
    municipalities            {'神奈川県'}
    address                   {'岬町1-4-5'}
    tel_number                {'09012345678'}
    build_name                {'カガヤキハイツ'}
    token                     {'444556'}
  end
end
