FactoryBot.define do
  factory :item do
    name              {'test'}
    description       {'test'}
    category_id       {2}
    information_id    {2}
    shipping_fee_id   {2}
    area_id           {2}
    days_id           {2}
    price             {300}
    association :user 

   after(:build) do |message|
    message.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
   end
  end
end
