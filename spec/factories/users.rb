FactoryBot.define do
  factory :user do
   nikename         {'test'}
   password         {'000000'}
   fist_name        {'田中'}
   list_name        {'太郎'}
   fist_name_kana   {'タナカ'}
   list_name_kana   {'タロウ'}
   birth_day        {'1996-05-14'}
  end
end