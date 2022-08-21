FactoryBot.define do
  factory :item do
    name          {'テスト'}
    explanation   {'テスト'}
    category_id    {'2'}
    situation_id   {'2'}
    load_id        {'2'}
    area_id        {'2'}
    deadline_id    {'2'}
    price         {'1000'}
  end
end
