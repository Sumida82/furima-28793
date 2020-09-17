FactoryBot.define do
  factory :order_address do
    post_code          {"123-4567"}
    prefecture_code_id {"2"}
    city               {"あああ市"}
    house_number       {"あいう7-8-7"}
    building_name      {"あいうえおビル"}
    phone_number       {"09012345678"}
    token              {"nvkngkfkalj"}
  end
end
