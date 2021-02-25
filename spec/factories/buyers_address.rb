FactoryBot.define do
  factory :buyers_address do
    postal_code      {'123-4567'}
    prefectures_id   { 2 }
    municipalities   {'東京都'}
    address          {'1-1'}
    building         {'東京ハイツ'}
    tel              {'09012345678'}
    token            {'tok_abcdefghijk00000000000000000'}
    
  end
end