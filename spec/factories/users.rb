FactoryBot.define do
  factory :user do
    nickname                 {'test'}
    email                    {'test@example'}
    password                 {'dmfFFE12'}
    password_confirmation    {password}
    last_name_kannzi         {'試し'}
    first_name_kannzi        {'試し'}
    last_name_katakana       {'テスト'}
    first_name_katakana      {'テスト'}
    birthday                 {'2020/10/01'}
  end
end
