FactoryBot.define do
  factory :purchase_shipping do
    post_code { '123-4567' }
    municipality { '名古屋市' }
    address { 'テスト' }
    phone_number { '09000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
    building { 'テスト' }
    area_id { 3 }
    item_id { 1 }
  end
end
