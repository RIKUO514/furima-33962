FactoryBot.define do
  factory :buyers_address do
    postal_cobe      {'123-4567'}
    prefectures      { 2 }
    municipalities   {'東京都'}
    address          {'1-1'}
    building         {'東京ハイツ'}
   
  end
end