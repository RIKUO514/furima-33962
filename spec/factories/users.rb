FactoryBot.define do
  factory :user do
   nikename         {'test'}
   email            {Faker::Internet.free_email}
   password         {'aaa111'}
   password_confirmation {password}
   fist_name        {'田中'}
   list_name        {'太郎'}
   fist_name_kana   {'タナカ'}
   list_name_kana   {'タロウ'}
   birth_day        {'1996-05-14'}
   
  end
end