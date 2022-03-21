FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '苗字' }
    first_name            { '名前' }
    last_name_kana        { 'セイ' }
    first_name_kana       { 'メイ' }
    birth_date            { '1999-01-01' }
  end
end
