FactoryBot.define do
  factory :item do
    name               {"怖い鬼"}
    introduction       {"これはとても怖ーい鬼です。気をつけて下さい。"}
    category_id        {"2"}
    trading_status_id  {"4"}
    postage_payer_id   {"2"}
    prefecture_code_id {"11"}
    preparation_day_id {"2"}
    price              {"3000"}
    association :user
  end
end
