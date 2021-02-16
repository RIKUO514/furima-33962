FactoryBot.define do
  factory :item do
    name              {'test'}
    description       {'test'}
    category_id       {1}
    information_id    {1}
    shipping_fee_id   {1}
    area_id           {1}
    days_id           {1}
    price             {'300'}

   after(:build) do |message|
    message.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
   end
  end
end
