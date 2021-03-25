FactoryBot.define do
  factory :user do
    nick_name                    {'玉五郎'}
    email                        {Faker::Internet.free_email}
    password                     { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation        {password}
    last_name                    {'神田'}
    first_name                   {'義彦'}
    last_name_furigana           {'カンダ'}
    first_name_furigana          {'ヨシヒコ'}
    birth_day                    {Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }






  end
end