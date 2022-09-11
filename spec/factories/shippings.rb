FactoryBot.define do
  factory :shipping do
    post_code         { 0o000000 }
    area_id           { 2 }
    municipality      { 'テスト' }
    address           { 'テスト' }
    building          { 'テスト' }
    phone_number      { 0o0000000000 }
  end
end
